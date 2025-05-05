% Base case: the sum of an empty list is 0
sumlist([], 0).

% Recursive case: add the head to the sum of the tail
sumlist([Head|Tail], Sum) :-
    sumlist(Tail, RestSum),
    Sum is Head + RestSum.


% sumlist([1, 2, 3, 4], S).
