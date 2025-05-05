% Base case: deleting the 1st element means skipping the head and returning the tail
delete(1, [_|Tail], Tail).

% Recursive case: move down the list, decrementing N
delete(N, [Head|Tail], [Head|ResultTail]) :-
    N > 1,
    N1 is N - 1,
    delete(N1, Tail, ResultTail).


% delete(2, [a, b, c, d], R).

