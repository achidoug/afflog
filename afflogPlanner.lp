%afflog planner 
%need a domain file and an input file to run

cognitiveState(correct;wrong;unknown).
	
%domain inference rules. 

chapterBefore(CH1,CH2):-chapterBegins(CH2,SECT);chapterEnds(CH1,SECT).

transchapterBefore(CH1,CH2):-chapterBegins(CH2,SECT);chapterEnds(CH1,SECT).
transchapterBefore(CH1,CH3):-transchapterBefore(CH1,CH2);transchapterBefore(CH2,CH3).
transchapterBefore(CH1,CH4):-transchapterBefore(CH1,CH2);transchapterBefore(CH2,CH3);transchapterBefore(CH3,CH4).

%Ena tutorial teleiwnei sto telos enos kefalaiou .
tutorialEndsAtEndOfChapter(TUT,CH):-hasTutorialEnd(TUT,SECT);chapterEnds(CH,SECT).

						 
%Ena tutorial emperiexei kapoio kefalaio otan: 
containsChapter(TUT,CH):-hasTutorialStart(TUT,SECT1);
                         hasChapterSection(CH1,SECT1);
						 hasTutorialEnd(TUT,SECT2);
						 hasChapterSection(CH2,SECT2);
						 transchapterBefore(CH1,CH);
						 transchapterBefore(CH,CH2);
						 not chapterEnds(CH,SECT2);
						 chapter(CH;CH1;CH2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEC fluents 

fluent(taught(TUT,C))      :- tutorial(TUT); cognitiveState(C).  
fluent(didTest(TST))       :- test(TST).
event(doTutorial(TUT))     :- tutorial(TUT).
event(doTest(TST))         :- test(TST).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%alternative startingPosition: No tutorials taught (absenceofTutorials).
%holdsAt(taught(absenceofTutorials,unknown),0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Axiomatization.

%plan
{mayhappens(E,T)}:- event(E);time(T).

% Allows only one action to occur at each timepoint
:- mayhappens(E1,T); mayhappens(E2,T); E1 !=E2; event(E1); event(E2);time(T).

%we must have 1 happens each timestep. 
:-not happens(_,T);T!=maxstep;time(T).


%%%
%Actions

initiates(doTutorial(TUT),taught(TUT,unknown),T) :- tutorial(TUT);time(T).

%The absenceofTutorials is terminated when a tutorial is learned.  
terminates(doTutorial(TUT),taught(absenceofTutorials,unknown),T) :- tutorial(TUT);time(T).
	
%A wrongly learned tutorial is terminated when this tutorial is relearned.  
terminates(doTutorial(TUT),taught(TUT,wrong),T)  :- tutorial(TUT);time(T).
													
															
%If a test is correct, which in this planner we assume so, then all the taught tutorials that 
%Start at this test's chapter AND end within this chapter are correct.
terminates(doTest(TST),taught(TUT,unknown),T) :-holdsAt(taught(TUT,unknown),T); 
                                                hasChapterTest(CH,TST);
												hasTutorialEnd(TUT,SECTEND);
												hasTutorialStart(TUT,SECTSTART);
                                                hasChapterSection(CH,SECTSTART);	
							        		  1{tutorialEndsAtEndOfChapter(TUT,CH);
											    hasChapterSection(CH,SECTEND)};	
	                                            time(T).
							
												
%If a test is correct, which in this planner we assume so, then all the taught tutorials that 
%Start at this test's chapter AND end within this chapter are correct.
initiates(doTest(TST),taught(TUT,correct),T):- holdsAt(taught(TUT,unknown),T); 
                                                hasChapterTest(CH,TST);
												hasTutorialEnd(TUT,SECTEND);
												hasTutorialStart(TUT,SECTSTART);
                                                hasChapterSection(CH,SECTSTART);	
							        		  1{tutorialEndsAtEndOfChapter(TUT,CH);
											    hasChapterSection(CH,SECTEND)};	
	                                            time(T).
							
							
							
							
initiates(doTest(TST1),taught(TUT,correct),T ):- holdsAt(taught(TUT,unknown),T); 
                                                 hasTutorialStart(TUT,SECTSTART);											
								                 hasTutorialEnd(TUT,SECTEND);
                                                 hasChapterSection(CHSTART,SECTSTART);
												 holdsAt(didTest(TST0),T);
                                                 hasChapterTest(CHSTART,TST0);
												 hasChapterTest(CHEND,TST1);
													 1{a(TUT,CHSTART,CHEND,SECTEND);
													   b(CHSTART,CHEND,TUT);
													   c(TUT,T);
													   d(TUT,T,CHEND)};
                                                 time(T).
													
terminates(doTest(TST1),taught(TUT,unknown),T ):-    holdsAt(taught(TUT,unknown),T); 
                                                     hasTutorialStart(TUT,SECTSTART);											
								                     hasTutorialEnd(TUT,SECTEND);
                                                     hasChapterSection(CHSTART,SECTSTART);
													 holdsAt(didTest(TST0),T);
                                                     hasChapterTest(CHSTART,TST0);
													 hasChapterTest(CHEND,TST1);
													 1{a(TUT,CHSTART,CHEND,SECTEND);
													   b(CHSTART,CHEND,TUT);
													   c(TUT,T);
													   d(TUT,T,CHEND)};
                                                     time(T).
													
%category a:
%|-CHSTART-|-CHEND-|
%    |---TUT--->| 
		 
a(TUT,CHSTART,CHEND,SECTEND):- hasChapterSection(CHEND,SECTEND);chapterBefore(CHSTART,CHEND);
                              not containsChapter(TUT,CH);chapter(CH);tutorial(TUT).


%category b:
%|-CHSTART-|-CHEND-|-CHOTHER-|
%    |---TUT------>| 
b(CHSTART,CHEND,TUT):- tutorialEndsAtEndOfChapter(TUT,CHEND);chapterBefore(CHSTART,CHEND);
not containsChapter(TUT,CH);chapter(CH).	

%category c:
%|-CHSTART-|-CHMID-|-CHEND-|
%    |---TUT--------->| 
c(TUT,T):- containsChapter(TUT,CHMID);hasChapterTest(CHMID,TST);holdsAt(didTest(TST),T);time(T).


%category d:
%|-CHSTART-|-CHMID-|-CHEND-|-CHOther?
%    |---TUT-------------->| 
d(TUT,T,CHEND):- tutorialEndsAtEndOfChapter(TUT,CHEND);
                 containsChapter(TUT,CHMID);
				 hasChapterTest(CHMID,TST);
				 holdsAt(didTest(TST),T);
				 time(T).

																				
												
initiates(doTest(TST),didTest(TST),T)       :- test(TST);time(T).										   



%%%
%prohpo8eseis gia happens

%non-start tutorials. 
b(TUT):-not hasTutorialStart(TUT,start);tutorial(TUT).

%An eimaste sthn arxikh katastash mporoun na ginoun mono arxika tutorials.
happens(doTutorial(TUT),T):-holdsAt(taught(absenceofTutorials,unknown),T);
                            mayhappens(doTutorial(TUT),T); 
				            not b(TUT);
				            time(T);
				            tutorial(TUT).
							
%An den eimaste sthn arxikh katastash...	



%edw 8a grapsw gia to ti ginetai an ena tutorial einai wrong.
happens(doTutorial(TUT1),T):- mayhappens(doTutorial(TUT1),T); 
                     1{holdsAt(taught(TUT,unknown),T);
					   holdsAt(taught(TUT,correct),T)};
					 TUT!=absenceofTutorials;
                     hasTutorialStart(TUT1,SECT);
					 hasTutorialEnd(TUT,SECT);
					 time(T).


%tests

%mporeis na kaneis test an yparxei unknown tutorial pou ksekinaei sto chapter tou sugekrimenou test.
happens(doTest(TST),T):- mayhappens(doTest(TST),T); 		
                        holdsAt(taught(TUT,unknown),T);
                        time(T);
					    hasChapterTest(CH,TST);
					    hasTutorialStart(TUT,SECT);
						hasChapterSection(CH,SECT).

%mporeis na kaneis test an yparxei unknown tutorial pou teleiwnei prin to telos tou kefalaiou
%tou sugekrimenou test.
happens(doTest(TST),T):- mayhappens(doTest(TST),T); 		
                         holdsAt(taught(TUT,unknown),T);
                         time(T);
						 hasChapterTest(CH,TST);
						 hasTutorialEnd(TUT,SECT);
					 	 hasChapterSection(CH,SECT);
		 				 not chapterBegins(CH,SECT).
						

%mporeis na kaneis test an yparxei unknown tutorial pou teleiwnei sto telos tou kefalaiou
%tou sugekrimenou test.					
happens(doTest(TST),T):- mayhappens(doTest(TST),T); 		
                         holdsAt(taught(TUT,unknown),T);
                         time(T);
						 hasChapterTest(CH,TST);
						 tutorialEndsAtEndOfChapter(TUT,CH).						 
 

%mporeis na kaneis test an yparxei unknown tutorial pou emperiexei to kefalaio tou sugekrimenou test.
happens(doTest(TST),T):- mayhappens(doTest(TST),T); 		
                         holdsAt(taught(TUT,unknown),T);
                         time(T);
						 hasChapterTest(CH,TST);
						 containsChapter(TUT,CH).						 
						 						 
						 						 
%constraints
	 
%den ginetai na exoume 2 unknown tutorials pou na ksekinane apo to idio shmeio. 
:-happens(doTutorial(TUT1),T);holdsAt(taught(TUT2,unknown),T);
  hasTutorialStart(TUT1,SECT);hasTutorialStart(TUT2,SECT);TUT1!=TUT2.
 
%den ginetai na exoume 2 correct tutorials pou na ksekinane apo to idio shmeio. 
:-happens(doTutorial(TUT1),T);holdsAt(taught(TUT2,correct),T);
  hasTutorialStart(TUT1,SECT);hasTutorialStart(TUT2,SECT);TUT1!=TUT2. 
  

%den mporeis na kaneis tutorial pou exeis ma8ei, ektos an to exeis ma8ei la8os. 
:-happens(doTutorial(TUT),T);holdsAt(taught(TUT,C),T);C!=wrong.

%den mporeis na exeis to idio tutorial me diaforetiko cognitiveState.
:-holdsAt(taught(TUT,C),T);holdsAt(taught(TUT,C1),T);C1!=C.

%den mporeis na kaneis test, an exeis kanei hdh kapoio test ths idias ylhs.
:-happens(doTest(TST),T);holdsAt(didTest(TST1),T);hasChapterTest(CH,TST);hasChapterTest(CH,TST1).
	 
%den mporeis na kaneis allo tutorial sugekrimenou kefalaiou an exeis kanei kapoio test apo ayto to kefalaio.
:-happens(doTutorial(TUT),T);holdsAt(didTest(TST),T);
                             hasChapterTest(CH,TST);
							 hasTutorialStart(TUT,SECT);
							 hasChapterSection(CH,SECT).
							 
							 
%den mporeis na kaneis tutorial epomenou kefalaiou an den einai correct ta prohgoumena kefalaia. 

:-happens(doTutorial(TUT),T);hasTutorialStart(TUT,SECT);holdsAt(taught(PASTTUT,unknown),T);hasTutorialStart(PASTTUT,PASTSECT);
  hasChapterSection(CH2,SECT);
  hasChapterSection(CH1,PASTSECT); 
  transchapterBefore(CH1,CH2). 
							 
	  
%den mporeis na kaneis test prohgoumenou kefalaiou an exeis kanei tutorials poy arxizoun se allo kefalaio.
:- happens(doTest(TST),T);
   holdsAt(taught(TUT,unknown),T);
   hasTutorialStart(TUT,SECT);
   hasChapterSection(CH,SECT);
   hasChapterTest(CH0,TST);
   chapterBefore(CH0,CH);
   time(T).
   
 %den mporeis na kaneis test prohgoumenou kefalaiou an exeis kanei test epomenou kefalaiou.
 :- happens(doTest(TST),T);
    holdsAt(didTest(TST1),T);
    hasChapterTest(CH,TST);
    hasChapterTest(CH1,TST1);
    transchapterBefore(CH,CH1);
    time(T).

%An exoume petuxei to goal, mhn kaneis alla mayhappens. 		   
:-mayhappens(E,T);goal(T);time(T).		   
 
not not goal(maxstep).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%show
#show happens/2.    
%#show holdsAt/2.
%#show mayhappens/2.
%#show containsChapter/2.