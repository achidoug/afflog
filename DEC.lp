%Discrete Event Calculus for ASP 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Discete Event Calculus. 
time(0..maxstep).


% DEC 5
holdsAt(F,T+1) :- holdsAt(F,T);
                  not _new_pred_1(T,F);
                  time(T);
                  fluent(F);
                  T<maxstep.

% DEC 6
 :- {not holdsAt(F,T+1)}0;
    not holdsAt(F,T);
    not _new_pred_2(T,F);
    fluent(F);
    time(T);
    T<maxstep.

% DEC 9
holdsAt(F,T+1) :- happens(E,T),initiates(E,F,T),event(E),fluent(F),time(T),T<maxstep.

% DEC 10
 :- {not holdsAt(F,T+1)}0;
     happens(E,T);
     event(E);
     fluent(F);
     terminates(E,F,T);
     time(T);
     T<maxstep.


_new_pred_1(T,F) :- happens(E,T);
                    terminates(E,F,T);
                    event(E);
                    fluent(F).


_new_pred_2(T,F) :- happens(E,T);
                    initiates(E,F,T);
                    event(E);
                    fluent(F).




{holdsAt(F,T)}:-fluent(F);
 time(T).
