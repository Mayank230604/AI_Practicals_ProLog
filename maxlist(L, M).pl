% Base case: the max of a single-element list is the element itself
maxlist([X], X).

% Recursive case: compare head with max of the tail
maxlist([H|T], Max) :-
    maxlist(T, MaxTail),
    Max is max(H, MaxTail).


% maxlist([3, 5, 2, 8, 1], M).

