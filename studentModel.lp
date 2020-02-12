cognitiveState(correct;wrong;unknown).
emotionalState(neutral;flow;delight;bored;confused;frustrated).
testResults(correct;wrong).

fluent(currentEmotion(E))      :- emotionalState(E).
fluent(taught(TUT,C))          :- tutorial(TUT); cognitiveState(C).  
fluent(currentlylearning(TUT)) :- tutorial(TUT).  
fluent(currentlyTesting(TST))  :- test(TST).  
fluent(currentChapter(CH))     :- chapter(CH). % used for determining when to test
fluent(currentSubChapter(SUB))  :- subChapter(SUB). % used for determining when to test


event(startTutorial(TUT))   :- tutorial(TUT).
event(finishTutorial(TUT))  :- tutorial(TUT).
event(experienceEmotion(E)) :- emotionalState(E).
event(startTest(TST))       :- test(TST).
event(finishTest(TST,TR))   :- test(TST);testResults(TR).


initiates(startTutorial(TUT),currentlylearning(TUT),T)   :- tutorial(TUT);
												            time(T).


initiates(startTutorial(TUT),currentSubChapter(SUB),T)   :-tutorial(TUT);
														   subChapter(SUB);
														   hasTutorialStart(TUT,SUB); 
														   time(T).	

														   
initiates(startTutorial(TUT),currentChapter(CH),T)   :-    tutorial(TUT);
														   subChapter(SUB);
														   hasTutorialStart(TUT,SUB); 
														   chapter(CH);
                                                           hasChapterSubchapter(CH,SUB); 
														   time(T).															   


terminates(startTutorial(TUT),currentSubChapter(SUB),T):-  holdsAt(currentSubChapter(SUB),T);
                                                           tutorial(TUT);
	    												   subChapter(SUB);
														   time(T).	


terminates(startTutorial(TUT),currentChapter(CH),T)   :-   tutorial(TUT);
														   subChapter(SUB);
														   hasTutorialStart(TUT,SUB); 
														   chapter(CH);
                                                           not hasChapterSubchapter(CH,SUB); 
 													       time(T).		
														   
															
initiates(startTest(TST),currentlyTesting(TST),T)        :- test(TST);
												            time(T).
															
initiates(finishTutorial(TUT),taught(TUT,unknown),T)   :-   tutorial(TUT);
												            time(T).

															
terminates(finishTutorial(TUT),currentlylearning(TUT),T)  :- holdsAt(currentlylearning(TUT),T);
                                                             tutorial(TUT);
												             time(T).
															 

terminates(finishTest(TST,TR),currentlyTesting(TST),T)    :- holdsAt(currentlyTesting(TST),T);
                                                             test(TST);
															 testResults(TR);
												             time(T).
	
	
%when test finishes, 	terminate the unknown and wrong taught subjects of that chapter

terminates(finishTest(TST,TR),taught(TUT,unknown),T)    :- testResults(TR);
														   tutorial(TUT);
														   hasChapterTest(CH,TST);
														   hasChapterSubchapter(CH,SUB); 
                                                           hasTutorialStart(TUT,SUB); 
 												           time(T).	

														   
initiates(finishTest(TST,wrong),taught(TUT,wrong),T)    :- holdsAt(taught(TUT,unknown),T); 
														   hasChapterTest(CH,TST);
														   hasChapterSubchapter(CH,SUB); 
                                                           hasTutorialStart(TUT,SUB); 
 												           time(T).	


initiates(finishTest(TST,correct),taught(TUT,correct),T):- holdsAt(taught(TUT,unknown),T); 
														   hasChapterTest(CH,TST);
														   hasChapterSubchapter(CH,SUB); 
                                                           hasTutorialStart(TUT,SUB); 
 												           time(T).	

													 
initiates(experienceEmotion(E),currentEmotion(E),T)      :-  emotionalState(E);
													         time(T).

terminates(experienceEmotion(E),currentEmotion(E1),T):-      holdsAt(currentEmotion(E1),T);
															 E1!=E;
														     emotionalState(E;E1);
															 time(T). 		
															 
														 
%%%CONSTRAINTS

%A student cannot be learning more than a single tutorial at a given time.   

:- holdsAt(currentlylearning(TUT),T); holdsAt(currentlylearning(TUT1),T);
                                    TUT!=TUT1;
									time(T);
									tutorial(TUT;TUT1).
									

%there cannot be more than 1 currentEmotion at a single time 

:- holdsAt(currentEmotion(E),T);holdsAt(currentEmotion(E1),T);
                                    E!=E1;
									time(T);
									emotionalState(E;E1).			
								
									
:-holdsAt(taught(TUT,C),0);
  tutorial(TUT);
  cognitiveState(C). 
  				
:-holdsAt(currentlylearning(TUT),0);
  tutorial(TUT).  
  				
:-holdsAt(currentlyTesting(TST),0);
  test(TST).  
  
:-holdsAt(currentChapter(CH),0);
  chapter(CH). 
  
:-holdsAt(currentSubChapter(SUB),0);
  subChapter(SUB). 
	
	
%input	
holdsAt(currentEmotion(neutral),0).


happens(experienceEmotion(delight),1).
happens(startTutorial(tut1),1).
happens(finishTutorial(tut1),2).
happens(startTutorial(tut3),3).
happens(finishTutorial(tut3),4).
happens(startTest(test1),5).
happens(finishTest(test1,correct),6).

% No fluent is released
:- {not releasedAt(F,0)}0, fluent(F).     
#show holdsAt/2.                            			
#show happens/2.
