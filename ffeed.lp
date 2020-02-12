%afflog ffeed 
%need a domain file and an input file to run
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%secondary predicates 
cognitiveState(correct;wrong;unknown).
emotionalState(neutral;flow;delight;bored;confused;frustrated).
emotionArousal(high;mid;low).
testResults(correct;wrong).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEC fluents 
fluent(currentEmotion(E,A))      :- emotionalState(E);emotionArousal(A). %At this point we only take into account only one emotion. Though we should have multiple emotions. 
fluent(taught(TUT,C))            :- tutorial(TUT); cognitiveState(C).  
fluent(didTest(TST))             :- test(TST).
event(doTutorial(TUT))           :- tutorial(TUT).
event(doTest(TST,TR))            :- test(TST);testResults(TR).
event(userExperiencesEmotion(E)) :- emotionalState(E).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
%Actions

initiates(userExperiencesEmotion(E),currentEmotion(E,high),T) :- holdsAt(currentEmotion(E,mid),T);
                                                                 time(T);
																 emotionalState(E).  
																 
terminates(userExperiencesEmotion(E),currentEmotion(E,mid),T) :-holdsAt(currentEmotion(E,mid),T);
                                                                 time(T);
																 emotionalState(E). 																 

initiates(userExperiencesEmotion(E),currentEmotion(E,mid),T) :- holdsAt(currentEmotion(E,low),T);
                                                                time(T); 											 
																emotionalState(E).  
																
terminates(userExperiencesEmotion(E),currentEmotion(E,low),T) :-holdsAt(currentEmotion(E,low),T);
                                                                 time(T);
																 emotionalState(E). 																 


initiates(userExperiencesEmotion(E),currentEmotion(E,low),T) :- holdsAt(currentEmotion(E1,A),T);
                                                                emotionArousal(A);
                                                                not E1=E; 
																emotionalState(E);
																emotionalState(E1);
                                                                time(T).  
																
terminates(userExperiencesEmotion(E),currentEmotion(E1,A),T) :- holdsAt(currentEmotion(E1,A),T);
                                                                not E1=E; 
																emotionArousal(A);
																emotionalState(E);
																emotionalState(El);
                                                                time(T).  
																


%%%%%%%%%%put emotions here.

initiates(doTutorial(TUT),taught(TUT,unknown),T) :- tutorial(TUT);time(T).
	
%A wrongly learned tutorial is terminated when this tutorial is relearned.  
terminates(doTutorial(TUT),taught(TUT,wrong),T)  :- tutorial(TUT);time(T).
															
%If a test is correct, then all the taught tutorials that start at this test's chapter AND end within this chapter are correct.
terminates(doTest(TST,TR),taught(TUT,unknown),T) :-holdsAt(taught(TUT,unknown),T); 
                                                        testResults(TR);
														hasChapterTest(CH,TST);
														hasTutorialEnd(TUT,SECTEND);
														hasTutorialStart(TUT,SECTSTART);
														hasChapterSection(CH,SECTSTART);	
													  1{tutorialEndsAtEndOfChapter(TUT,CH);
														hasChapterSection(CH,SECTEND)};	
														time(T).
																			
initiates(doTest(TST,correct),taught(TUT,correct),T):-  holdsAt(taught(TUT,unknown),T); 
														hasChapterTest(CH,TST);
														hasTutorialEnd(TUT,SECTEND);
														hasTutorialStart(TUT,SECTSTART);
														hasChapterSection(CH,SECTSTART);	
													  1{tutorialEndsAtEndOfChapter(TUT,CH);
														hasChapterSection(CH,SECTEND)};	
														time(T).

initiates(doTest(TST,wrong),taught(TUT,wrong),T):-  holdsAt(taught(TUT,unknown),T); 
														hasChapterTest(CH,TST);
														hasTutorialEnd(TUT,SECTEND);
														hasTutorialStart(TUT,SECTSTART);
														hasChapterSection(CH,SECTSTART);	
													  1{tutorialEndsAtEndOfChapter(TUT,CH);
														hasChapterSection(CH,SECTEND)};	
														time(T).												
								
initiates(doTest(TST1,correct),taught(TUT,correct),T ):- holdsAt(taught(TUT,unknown),T); 
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
													
initiates(doTest(TST1,wrong),taught(TUT,wrong),T     ):- holdsAt(taught(TUT,unknown),T); 
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
														 
terminates(doTest(TST1,TR),taught(TUT,unknown),T ):- holdsAt(taught(TUT,unknown),T); 
                                                     testResults(TR);
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
							 
														 
%%%CONSTRAINTS
									

%there cannot be more than 1 currentEmotion at a single time 

:- holdsAt(currentEmotion(E,A),T);holdsAt(currentEmotion(E1,A1),T);
                                   1{E!=E1;
									A!=A1};
									time(T);
             						emotionalState(E;E1);
									emotionArousal(A;A1).
					
	
					
%A tutorial cannot have different cognition values
:-holdsAt(taught(TUT,C),0);holdsAt(taught(TUT,C1),0);not C=C1.									

									
									
%:-holdsAt(taught(TUT,_),0);
%  not exeptionrule(TUT).
  		
% No fluent is released
:- {not releasedAt(F,0)}0, fluent(F).     
#show holdsAt/2.                            			
#show happens/2.
