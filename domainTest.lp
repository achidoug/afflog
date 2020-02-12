%Afflog domain test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Predicates
section(start;sect2;sect3;sect4;sect5;sect6;end).
tutorial(absenceofTutorials;tut1;tut2;tut3;tut4;tut5;tut6;tut7;tut8;tut9;tut10;tut11;tut12;tut13;tut14;tut15;tut16;tut17).
chapter(ch1;ch2;ch3;ch4).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%start 2    3    4    5    6    end%
%|-1-->|-2->|-3->|-4->|            %
%|--------5---------->|            %
%|-------6------>|                 %
%      |--------7---->|            %
%|----8---->|               |-17->|%  
%      |----9--->|          |-16->|% 
%           |--10---->|     |-15->|%   
%                     |-11->|-13->|%
%|------------tut12-------->|-14->|% 	
%|    ch1   |   ch2   | ch3 | ch4 |%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test(test1;test2;test3;test4;test5;test6;test7).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%chapter binary properties
hasChapterSection(ch1,start). 
hasChapterSection(ch1,sect2).
hasChapterSection(ch2,sect3).
hasChapterSection(ch2,sect4). 
hasChapterSection(ch3,sect5). 
hasChapterSection(ch4,sect6). 
hasChapterSection(ch4,end).
chapterBegins(ch1,start).
chapterEnds(ch1,sect3).
chapterBegins(ch2,sect3).
chapterEnds(ch2,sect5).
chapterBegins(ch3,sect5).
chapterEnds(ch3,sect6).
chapterBegins(ch4,sect6).
chapterEnds(ch4,end).

hasChapterTest(ch1,test1).
hasChapterTest(ch1,test2).
hasChapterTest(ch2,test3).
hasChapterTest(ch2,test4).
hasChapterTest(ch3,test5).
hasChapterTest(ch3,test6).
hasChapterTest(ch4,test7).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tutorial binary properties
hasTutorialStart(tut1,start).
hasTutorialEnd(tut1,sect2).
hasTutorialStart(tut5,start).
hasTutorialEnd(tut5,sect5).
hasTutorialStart(tut6,start).
hasTutorialEnd(tut6,sect4).
hasTutorialStart(tut8,start).
hasTutorialEnd(tut8,sect3).
hasTutorialStart(tut2,sect2).
hasTutorialEnd(tut2,sect3).
hasTutorialStart(tut7,sect2).
hasTutorialEnd(tut7,sect5).
hasTutorialStart(tut9,sect2).
hasTutorialEnd(tut9,sect4).
hasTutorialStart(tut3,sect3).
hasTutorialEnd(tut3,sect4).
hasTutorialStart(tut10,sect3).
hasTutorialEnd(tut10,sect5).
hasTutorialStart(tut4,sect4).
hasTutorialEnd(tut4,sect5).
hasTutorialStart(tut11,sect5).
hasTutorialEnd(tut11,sect6).
hasTutorialStart(tut12,start).
hasTutorialEnd(tut12,sect6).
hasTutorialStart(tut13,sect6).
hasTutorialEnd(tut13,end).
hasTutorialStart(tut14,sect6).
hasTutorialEnd(tut14,end).
hasTutorialStart(tut15,sect6).
hasTutorialEnd(tut15,end).
hasTutorialStart(tut16,sect6).
hasTutorialEnd(tut16,end).
hasTutorialStart(tut17,sect6).
hasTutorialEnd(tut17,end).
