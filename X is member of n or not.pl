% Base case: X is the head of the list
memb(X, [X|_]).

% Recursive case: check the tail of the list
memb(X, [_|T]) :-
    memb(X, T).


% memb(3, [1, 2, 3, 4]).
