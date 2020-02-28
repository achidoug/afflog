:-holdsAt(taught(TUT,C),0);cognitiveState(C).
:-holdsAt(didTest(TST),0);test(TST).
:-holdsAt(currentEmotion(E,A),0);emotionalState(E);emotionArousal(A);E!=neutral;A!=low. 
holdsAt(currentEmotion(neutral,low),0).
happens(doTutorial(tut1),0).
happens(userExperiencesEmotion(neutral),0).
