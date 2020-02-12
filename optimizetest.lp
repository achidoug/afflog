
%Input the courses. 

%1{course(1..5)}1.

course(1..5).


courseContains(1,tut12;1,test1;1,test3;1,test6;1,tut14).
courseContains(2,tut12;2,test1;2,test3;2,test6;2,tut13;2,test7).
courseContains(3,tut12;3,test1;3,test3;3,test6;3,tut15;3,test7).
courseContains(4,tut12;4,test1;4,test3;4,test6;4,tut16;4,test7).
courseContains(5,tut1;5,tut2;5,tut3;5,tut4;5,test1;5,test3;5,test6;5,tut17;5,test7).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tutorial properties. 
tutorial(absenceofTutorials;tut1;tut2;tut3;tut4;tut5;tut6;tut7;tut8;tut9;tut10;tut11;tut12;tut13;tut14;tut15;tut16;tut17).

tutorialtype(text;picture;audio;video).

tutorialDifficulty(1..3).

tutorialSpeed(1..3).

%%%%%%%%%%%%%%%%
%learning styles
%activeReflectiveDimension(1..3).
%sensingIntuitiveDimension(1..3).
%visualVerbalDimension(1..3).
%sequentialGlobalDimension(1..3).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hasTutorialType(tut12,video). 
hasTutorialactiveReflectiveDimension(tut12,3).
hasTutorialSensingIntuitiveDimension(tut12,1).
hasTutorialVisualVerbalDimension(tut12,1).
hasTutorialSequentialGlobalDimension(tut12,3).
hasTutorialDifficulty(tut12,2).
hasTutorialSpeed(tut12,1).

hasTutorialType(tut13,video). 
hasTutorialactiveReflectiveDimension(tut13,3).
hasTutorialSensingIntuitiveDimension(tut13,3).
hasTutorialVisualVerbalDimension(tut13,1).
hasTutorialSequentialGlobalDimension(tut13,3).
hasTutorialDifficulty(tut13,1).
hasTutorialSpeed(tut13,1).

hasTutorialType(tut14,text). 
hasTutorialType(tut14,picture). 
hasTutorialactiveReflectiveDimension(tut14,1).
hasTutorialSensingIntuitiveDimension(tut14,1).
hasTutorialVisualVerbalDimension(tut14,2).
hasTutorialSequentialGlobalDimension(tut14,1).
hasTutorialDifficulty(tut14,1).
hasTutorialSpeed(tut14,3).

hasTutorialType(tut15,text). 
hasTutorialactiveReflectiveDimension(tut15,2).
hasTutorialSensingIntuitiveDimension(tut15,3).
hasTutorialVisualVerbalDimension(tut15,3).
hasTutorialSequentialGlobalDimension(tut15,2).
hasTutorialDifficulty(tut15,3).
hasTutorialSpeed(tut15,2).

hasTutorialType(tut16,audio). 
hasTutorialactiveReflectiveDimension(tut16,2).
hasTutorialSensingIntuitiveDimension(tut16,1).
hasTutorialVisualVerbalDimension(tut16,3).
hasTutorialSequentialGlobalDimension(tut16,1).
hasTutorialDifficulty(tut16,2).
hasTutorialSpeed(tut16,2).

hasTutorialType(tut17,picture). 
hasTutorialactiveReflectiveDimension(tut17,1).
hasTutorialSensingIntuitiveDimension(tut17,3).
hasTutorialVisualVerbalDimension(tut17,1).
hasTutorialSequentialGlobalDimension(tut17,1).
hasTutorialDifficulty(tut17,1).
hasTutorialSpeed(tut17,3).


%The Active/Reflective dimension determines how a student likes to process information. Active students prefer trial and error methods and working with others in order to learn. 
%Reflective students prefer working alone and like to think deeply before acting. 

%ACTIVE STUDENTS
%the less points in hasTutorialactiveReflectiveDimension property of its tutorials a course has, the more active it is . 
%Sum the number of hasTutorialactiveReflectiveDimension score On a course. 
%courseActiveVal(C, S) :- S = #sum{ I,TUT:courseContains(C,TUT),hasTutorialactiveReflectiveDimension(TUT,I)},course(C).
%#minimize { S:courseActiveVal(C, S)}.
%#show courseActiveVal/2.
%/ACTIVE STUDENTS

%REFLECTIVE STUDENTS
%the more points in hasTutorialactiveReflectiveDimension property of its tutorials a course has, the more active it is . 
%Sum the number of hasTutorialactiveReflectiveDimension score On a course. 
%courseReflectiveVal(C, S) :- S = #sum{ I,TUT:courseContains(C,TUT),hasTutorialactiveReflectiveDimension(TUT,I)},course(C).
%#maximize { S:courseReflectiveVal(C, S)}.
%#show courseReflectiveVal/2.
%/REFLECTIVE STUDENTS


%The Sensing/Intuitive dimension determines how a student likes to perceive information. Whereas sensing students are practical thinkers, good at memorizing facts, 
%and like to use established methods and procedures, intuitive students prefer innovative ideas and can understand new concepts better but struggle when a task becomes repetitive. 

%SENSING STUDENTS
%the less points in hasTutorialSensingIntuitiveDimension property of its tutorials a course has, the more sensing it is . 
%Sum the number of hasTutorialSensingIntuitiveDimension score On a course. 
%courseSensingVal(C, S) :- S = #sum{ I,TUT:courseContains(C,TUT),hasTutorialSensingIntuitiveDimension(TUT,I)},course(C).
%#minimize { S:courseSensingVal(C, S)}.
%#show courseSensingVal/2.
%/SENSING STUDENTS

%INTUITIVE STUDENTS
%the more points in hasTutorialSensingIntuitiveDimension property of its tutorials a course has, the more intuitive it is . 
%Sum the number of hasTutorialSensingIntuitiveDimension score On a course. 
%courseIntuitiveVal(C, S) :- S = #sum{ I,TUT:courseContains(C,TUT),hasTutorialSensingIntuitiveDimension(TUT,I)},course(C).
%#maximize { S:courseIntuitiveVal(C, S)}.
%#show courseIntuitiveVal/2.
%/INTUITIVE STUDENTS


%The Visual/Verbal dimension measures the type of presentation material that a student prefers in order to better understand the subject of the course. Visual students value 
%images, videos and flowcharts over other modalities. Verbal students favour text or speech. 

%VISUAL STUDENTS
%the less points in hasTutorialVisualVerbalDimension property of its tutorials a course has, the more visual it is . 
%Sum the number of hasTutorialVisualVerbalDimension score On a course. 
%courseVisualVal(C, S) :- S = #sum{ I,TUT:courseContains(C,TUT),hasTutorialVisualVerbalDimension(TUT,I)},course(C).
%#minimize { S:courseVisualVal(C, S)}.
%#show courseVisualVal/2.
%/VISUAL STUDENTS

%VERBAL STUDENTS
%the more points in hasTutorialVisualVerbalDimension property of its tutorials a course has, the more verbal it is . 
%Sum the number of hasTutorialVisualVerbalDimension score On a course. 
%courseVerbalVal(C, S) :- S = #sum{ I,TUT:courseContains(C,TUT),hasTutorialVisualVerbalDimension(TUT,I)},course(C).
%#maximize { S:courseVerbalVal(C, S)}.
%#show courseVerbalVal/2.
%/VERBAL STUDENTS


%The Sequential/Global dimension deals with how students prefer to organize and work towards understanding information. While sequential students prefer learning in linear
%and incremental steps, gradually expanding their knowledge, global students prefer grasping the big picture first, and then focus on more specific subjects.

%SEQUENTIAL STUDENTS
%The more content a course has the more sequencial it is. 
%Count the size of a course. 
%courseSize(C, S) :- S = #count{ I : courseContains(C,I)}, course(C).
%Find the course with the most content
%#maximize { S:courseSize(C, S)}.
%#show courseSize/2.
%/SEQUENTIAL STUDENTS

%GLOBAL STUDENTS
%The less content a course has the more Global it is. 
%Count the size of a course. 
%courseSize(C, S) :- S = #count{ I : courseContains(C,I)}, course(C).
%Find the course with the most content
%#minimize { S:courseSize(C, S)}.
%#show courseSize/2.
%/GLOBAL STUDENTS





%courseSize(C, S) :- S = #count{ I : courseContains(C,I)}, course(C).
%tutorialsPerCourse(C, S) :- S = #count{T: courseContains(C,T),tutorial(T)}, course(C).
%tutorialPerCoursesizeRatio(C, RAT):- RAT= #sum{SIZE/T,C:courseSize(C,SIZE),tutorialsPerCourse(C, T)}, course(C).
%#show courseSize/2.
%#show tutorialsPerCourse/2.
%#show tutorialPerCoursesizeRatio/2.


#show course/1.




