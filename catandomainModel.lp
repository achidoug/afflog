chapter(ch1;ch2;ch3;ch4).
section(start;sect2;sect3;sect4;sect5;sect6;sect7;sect8;sect9;sect10;sect11;sect12;sect13;sect14;sect15;sect16;sect17;sect18;sect19;sect20;end).
tutorial(tut1;tut2;tut3;tut4;tut5;tut6;tut7;tut8;tut9;tut10;tut11;tut12;tut13;tut14;tut15;tut16;tut17;tut18;tut19;tut20;tut21;tut22;tut23;tut24).
test(test1;test2;test3;test4;test5;test6;test7).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%start 2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18    19   20  end%
%|-1-->|-2->|-3->|-4->|-5->|-6->|-7->|-8->|-9->|10->|11->|12->|13->|14->|15->|16->|17->|18->|20->|19->| %  
%                                                                                           |23->|22->| %      
%                                                        |-------------------------24----------->|      %   
%                                                                                                       %
%|--------------------------tut21--------------------------------------------------------------->|      %
%|                ch1                |   ch2             |                   ch3                 | ch4| %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tutorial properties. 

tutorialtype(text;picture;audio;video).

tutorialDifficulty(easy; normal; hard).

tutorialSpeed(slow; normal; fast).

%%%%%%%%%%%%%%%%
%learning styles

activeReflectiveDimension(active;reflective;mid).

sensingIntuitiveDimension(sensing;intuitive;mid).

visualVerbalDimension(visual;verbal;mid).

sequentialGlobalDimension(sequential;global;mid).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%chapter binary properties

hasChapterSection(ch1,start). 
hasChapterSection(ch1,sect2). 
hasChapterSection(ch1,sect3). 
hasChapterSection(ch1,sect4). 
hasChapterSection(ch1,sect5). 
hasChapterSection(ch1,sect6). 
hasChapterSection(ch1,sect7). 
hasChapterSection(ch2,sect8). 
hasChapterSection(ch2,sect9). 
hasChapterSection(ch2,sect10). 
hasChapterSection(ch2,sect11). 
hasChapterSection(ch3,sect12). 
hasChapterSection(ch3,sect13). 
hasChapterSection(ch3,sect14). 
hasChapterSection(ch3,sect15). 
hasChapterSection(ch3,sect16). 
hasChapterSection(ch3,sect17). 
hasChapterSection(ch3,sect18). 
hasChapterSection(ch3,sect19).
hasChapterSection(ch4,sect20). 
hasChapterSection(ch4,end). 
chapterBegins(ch1,start).
chapterEnds(ch1,sect8).
chapterBegins(ch2,sect8).
chapterEnds(ch2,sect12).
chapterBegins(ch3,sect12).
chapterEnds(ch3,sect20).
chapterBegins(ch4,sect20).
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

%tutorial 1
%wikihow 1.1 Check to see that you have all of the components of the game.
hasTutorialStart(tut1,start). 
hasTutorialEnd(tut1,sect2).
hasTutorialType(tut1,text). 
hasTutorialType(tut1,picture). 
hasTutorialactiveReflectiveDimension(tut1,active).
hasTutorialSensingIntuitiveDimension(tut1,sensing).
hasTutorialVisualVerbalDimension(tut1,mid).
hasTutorialSequentialGlobalDimension(tut1,sequential).
hasTutorialDifficulty(tut1,easy).
hasTutorialSpeed(tut1,fast).

%tutorial 2
%wikihow 1.2 Understand the goal of the game. 
hasTutorialStart(tut2,sect2). 
hasTutorialEnd(tut2,sect3).
hasTutorialType(tut2,text). 
hasTutorialType(tut2,picture). 
hasTutorialactiveReflectiveDimension(tut2,reflective).
hasTutorialSensingIntuitiveDimension(tut2,sensing).
hasTutorialVisualVerbalDimension(tut2,mid).
hasTutorialSequentialGlobalDimension(tut2,global).
hasTutorialDifficulty(tut2,easy).
hasTutorialSpeed(tut2,fast).

%tutorial 3
%wikihow 1.3 Make the outer frame.
hasTutorialStart(tut3,sect3). 
hasTutorialEnd(tut3,sect4).
hasTutorialType(tut3,text). 
hasTutorialType(tut3,picture). 
hasTutorialactiveReflectiveDimension(tut3,reflective).
hasTutorialSensingIntuitiveDimension(tut3,sensing).
hasTutorialVisualVerbalDimension(tut3,visual).
hasTutorialSequentialGlobalDimension(tut3,mid).
hasTutorialDifficulty(tut3,easy).
hasTutorialSpeed(tut3,fast).

%tutorial 4
%wikihow 1.4 Place the hexes. 
hasTutorialStart(tut4,sect4). 
hasTutorialEnd(tut4,sect5).
hasTutorialType(tut4,text). 
hasTutorialType(tut4,picture). 
hasTutorialactiveReflectiveDimension(tut4,reflective).
hasTutorialSensingIntuitiveDimension(tut4,sensing).
hasTutorialVisualVerbalDimension(tut4,mid).
hasTutorialSequentialGlobalDimension(tut4,mid).
hasTutorialDifficulty(tut4,easy).
hasTutorialSpeed(tut4,fast).

%tutorial 5
%wikihow 1.5 Place the tokens. 
hasTutorialStart(tut5,sect5). 
hasTutorialEnd(tut5,sect6).
hasTutorialType(tut5,text). 
hasTutorialType(tut5,picture). 
hasTutorialactiveReflectiveDimension(tut5,reflective).
hasTutorialSensingIntuitiveDimension(tut5,sensing).
hasTutorialSequentialGlobalDimension(tut5,global).
hasTutorialVisualVerbalDimension(tut5,mid).
hasTutorialDifficulty(tut5,easy).
hasTutorialSpeed(tut5,fast).

%tutorial 6
%wikihow 1.6 Place the robber. 
hasTutorialStart(tut6,sect6). 
hasTutorialEnd(tut6,sect7).
hasTutorialType(tut6,text). 
hasTutorialType(tut6,picture). 
hasTutorialactiveReflectiveDimension(tut6,reflective).
hasTutorialSensingIntuitiveDimension(tut6,sensing).
hasTutorialVisualVerbalDimension(tut6,visual).
hasTutorialSequentialGlobalDimension(tut6,mid).
hasTutorialDifficulty(tut6,easy).
hasTutorialSpeed(tut6,fast).

%tutorial 7
%wikihow 1.7 Place the cards. 
hasTutorialStart(tut7,sect7). 
hasTutorialEnd(tut7,sect8).
hasTutorialType(tut7,text). 
hasTutorialType(tut7,picture). 
hasTutorialactiveReflectiveDimension(tut7,reflective).
hasTutorialSensingIntuitiveDimension(tut7,sensing).
hasTutorialVisualVerbalDimension(tut7,visual).
hasTutorialSequentialGlobalDimension(tut7,global).
hasTutorialDifficulty(tut7,easy).
hasTutorialSpeed(tut7,fast).

%tutorial 8
%wikihow 2.1 Determine the turn order.
hasTutorialStart(tut8,sect8). 
hasTutorialEnd(tut8,sect9).
hasTutorialType(tut8,text). 
hasTutorialType(tut8,picture). 
hasTutorialactiveReflectiveDimension(tut8,reflective).
hasTutorialSensingIntuitiveDimension(tut8,sensing).
hasTutorialVisualVerbalDimension(tut8,verbal).
hasTutorialSequentialGlobalDimension(tut8,mid).
hasTutorialDifficulty(tut8,easy).
hasTutorialSpeed(tut8,fast).

%tutorial 9
%wikihow 2.2 Place the first settlements.
hasTutorialStart(tut9,sect9). 
hasTutorialEnd(tut9,sect10).
hasTutorialType(tut9,text). 
hasTutorialType(tut9,picture). 
hasTutorialactiveReflectiveDimension(tut9,reflective).
hasTutorialSensingIntuitiveDimension(tut9,sensing).
hasTutorialVisualVerbalDimension(tut9,verbal).
hasTutorialSequentialGlobalDimension(tut9,mid).
hasTutorialDifficulty(tut9,easy).
hasTutorialSpeed(tut9,fast).

%tutorial 10
%wikihow 2.3 Place the final settlements.
hasTutorialStart(tut10,sect10). 
hasTutorialEnd(tut10,sect11).
hasTutorialType(tut10,text). 
hasTutorialType(tut10,picture). 
hasTutorialactiveReflectiveDimension(tut10,reflective).
hasTutorialSensingIntuitiveDimension(tut10,sensing).
hasTutorialVisualVerbalDimension(tut10,mid).
hasTutorialSequentialGlobalDimension(tut10,sequential).
hasTutorialDifficulty(tut10,easy).
hasTutorialSpeed(tut10,fast).

%tutorial 11
%wikihow 2.4 Get your first resource cards. 
hasTutorialStart(tut11,sect11). 
hasTutorialEnd(tut11,sect12).
hasTutorialType(tut11,text). 
hasTutorialType(tut11,picture). 
hasTutorialactiveReflectiveDimension(tut11,mid).
hasTutorialSensingIntuitiveDimension(tut11,sensing).
hasTutorialVisualVerbalDimension(tut11,mid).
hasTutorialSequentialGlobalDimension(tut11,mid).
hasTutorialDifficulty(tut11,easy).
hasTutorialSpeed(tut11,fast).

%tutorial 12
%wikihow 3.1 Roll the dice. 
hasTutorialStart(tut12,sect12). 
hasTutorialEnd(tut12,sect13).
hasTutorialType(tut12,text). 
hasTutorialType(tut12,picture). 
hasTutorialactiveReflectiveDimension(tut12,reflective).
hasTutorialSensingIntuitiveDimension(tut12,sensing).
hasTutorialVisualVerbalDimension(tut12,verbal).
hasTutorialSequentialGlobalDimension(tut12,sequential).
hasTutorialDifficulty(tut12,easy).
hasTutorialSpeed(tut12,fast).

%tutorial 13
%wikihow 3.2 Take your turn actions.
hasTutorialStart(tut13,sect13). 
hasTutorialEnd(tut13,sect14).
hasTutorialType(tut13,text). 
hasTutorialType(tut13,picture). 
hasTutorialactiveReflectiveDimension(tut13,reflective).
hasTutorialSensingIntuitiveDimension(tut13,sensing).
hasTutorialVisualVerbalDimension(tut13,verbal).
hasTutorialSequentialGlobalDimension(tut13,global).
hasTutorialDifficulty(tut13,easy).
hasTutorialSpeed(tut13,fast).

%tutorial 14
%wikihow 3.3 Build structures.
hasTutorialStart(tut14,sect14). 
hasTutorialEnd(tut14,sect15).
hasTutorialType(tut14,text). 
hasTutorialType(tut14,picture). 
hasTutorialactiveReflectiveDimension(tut14,reflective).
hasTutorialSensingIntuitiveDimension(tut14,sensing).
hasTutorialVisualVerbalDimension(tut14,verbal).
hasTutorialSequentialGlobalDimension(tut14,sequential).
hasTutorialDifficulty(tut14,easy).
hasTutorialSpeed(tut14,fast).

%tutorial 15
%wikihow 3.4 Play a development card. 
hasTutorialStart(tut15,sect15). 
hasTutorialEnd(tut15,sect16).
hasTutorialType(tut15,text). 
hasTutorialType(tut15,picture). 
hasTutorialactiveReflectiveDimension(tut15,reflective).
hasTutorialSensingIntuitiveDimension(tut15,sensing).
hasTutorialVisualVerbalDimension(tut15,verbal).
hasTutorialSequentialGlobalDimension(tut15,sequential).
hasTutorialDifficulty(tut15,easy).
hasTutorialSpeed(tut15,fast).

%tutorial 16
%wikihow 3.5 Pay attention to the instructions on development cards because each card type has a different function.  
hasTutorialStart(tut16,sect16). 
hasTutorialEnd(tut16,sect17).
hasTutorialType(tut16,text). 
hasTutorialType(tut16,picture). 
hasTutorialactiveReflectiveDimension(tut16,reflective).
hasTutorialSensingIntuitiveDimension(tut16,sensing).
hasTutorialVisualVerbalDimension(tut16,verbal).
hasTutorialSequentialGlobalDimension(tut16,sequential).
hasTutorialDifficulty(tut16,easy).
hasTutorialSpeed(tut16,fast).

%tutorial 17
%wikihow 3.6 Trade as needed.  
hasTutorialStart(tut17,sect17). 
hasTutorialEnd(tut17,sect18).
hasTutorialType(tut17,text). 
hasTutorialType(tut17,picture). 
hasTutorialactiveReflectiveDimension(tut17,reflective).
hasTutorialSensingIntuitiveDimension(tut17,intuitive).
hasTutorialVisualVerbalDimension(tut17,verbal).
hasTutorialSequentialGlobalDimension(tut17,global).
hasTutorialDifficulty(tut17,easy).
hasTutorialSpeed(tut17,fast).

%tutorial 18
%wikihow 3.7 Watch out for sevens. 
hasTutorialStart(tut18,sect18). 
hasTutorialEnd(tut18,sect19).
hasTutorialType(tut18,text). 
hasTutorialType(tut18,picture). 
hasTutorialactiveReflectiveDimension(tut18,reflective).
hasTutorialSensingIntuitiveDimension(tut18,sensing).
hasTutorialVisualVerbalDimension(tut18,mid).
hasTutorialSequentialGlobalDimension(tut18,sequential).
hasTutorialDifficulty(tut18,easy).
hasTutorialSpeed(tut18,fast).

%tutorial 19
%wikihow 3.8 Use strategy to increase your chances of winning.
hasTutorialStart(tut19,sect20). 
hasTutorialEnd(tut19,end).
hasTutorialType(tut19,text). 
hasTutorialType(tut19,picture). 
hasTutorialactiveReflectiveDimension(tut19,reflective).
hasTutorialSensingIntuitiveDimension(tut19,intuitive).
hasTutorialVisualVerbalDimension(tut19,verbal).
hasTutorialSequentialGlobalDimension(tut19,global).
hasTutorialDifficulty(tut19,normal).
hasTutorialSpeed(tut19,fast).

%tutorial 20
%wikihow 3.9 Announce when you have 10 victory points. 
hasTutorialStart(tut20,sect19). 
hasTutorialEnd(tut20,sect20).
hasTutorialType(tut20,text). 
hasTutorialactiveReflectiveDimension(tut20,reflective).
hasTutorialSensingIntuitiveDimension(tut20,sensing).
hasTutorialVisualVerbalDimension(tut20,verbal).
hasTutorialSequentialGlobalDimension(tut20,global).
hasTutorialDifficulty(tut20,easy).
hasTutorialSpeed(tut20,fast).

%tutorial 21
%The Settlers of Catan - Learn to Play! youtube video. 
hasTutorialStart(tut21,start). 
hasTutorialEnd(tut21,sect20).
hasTutorialType(tut21,video). 
hasTutorialactiveReflectiveDimension(tut21,mid).
hasTutorialSensingIntuitiveDimension(tut21,intuitive).
hasTutorialVisualVerbalDimension(tut21,visual).
hasTutorialSequentialGlobalDimension(tut21,global).
hasTutorialDifficulty(tut21,normal).
hasTutorialSpeed(tut21,slow).

%tutorial 22
%Advanced Strategies in text form 
hasTutorialStart(tut22,sect20). 
hasTutorialEnd(tut22,end).
hasTutorialType(tut22,text). 
hasTutorialactiveReflectiveDimension(tut22,reflective).
hasTutorialSensingIntuitiveDimension(tut22,sensing).
hasTutorialVisualVerbalDimension(tut22,verbal).
hasTutorialSequentialGlobalDimension(tut22,sequential).
hasTutorialDifficulty(tut22,hard).
hasTutorialSpeed(tut22,normal).

%tutorial 23
%Winning Conditions Video
hasTutorialStart(tut23,sect19). 
hasTutorialEnd(tut23,sect20).
hasTutorialType(tut23,video). 
hasTutorialactiveReflectiveDimension(tut23,reflective).
hasTutorialSensingIntuitiveDimension(tut23,sensing).
hasTutorialVisualVerbalDimension(tut23,verbal).
hasTutorialSequentialGlobalDimension(tut23,sequential).
hasTutorialDifficulty(tut23,easy).
hasTutorialSpeed(tut23,fast).


%tutorial 24
%turn overview
hasTutorialStart(tut24,sect12). 
hasTutorialEnd(tut24,sect20).
hasTutorialType(tut24,text). 
hasTutorialactiveReflectiveDimension(tut24,reflective).
hasTutorialSensingIntuitiveDimension(tut24,sensing).
hasTutorialVisualVerbalDimension(tut24,visual).
hasTutorialSequentialGlobalDimension(tut24,sequential).
hasTutorialDifficulty(tut24,hard).
hasTutorialSpeed(tut24,normal).









