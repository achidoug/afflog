%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%starting state
%cannot have other taught tutorials at T=0,except...
:-holdsAt(taught(TUT,C),0);cognitiveState(C);
 TUT!=absenceofTutorials.


%cannot have other tests done at T=0, except...
:-holdsAt(didTest(TST),0).
%TST!=test3;

holdsAt(taught(absenceofTutorials,unknown),0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% primary catan domain goal reach the end of chapter 3.                  
goal(T):-holdsAt(taught(TUT,correct),T);
        hasTutorialEnd(TUT,sect20);
		 tutorial(TUT);
         time(T).
		 
		 
		 
%secondary goals for domain test                 
%goal(T):-holdsAt(taught(TUT,correct),T);
%         hasTutorialEnd(TUT,sect6);
%  	     tutorial(TUT);
%	     time(T).		 
		 

		 
:-goal(T);holdsAt(taught(TUT,unknown),T).
