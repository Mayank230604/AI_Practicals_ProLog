max(X, Y, M) :- 
    X >= Y, 
    M = X.

max(X, Y, M) :- 
    X < Y, 
    M = Y.


% max(5, 10, M).
% max(20, 15, M).
