% Base case: inserting at position 1 means putting I at the head of the list
insert(I, 1, L, [I|L]).

% Recursive case: move down the list, decrementing N
insert(I, N, [Head|Tail], [Head|ResultTail]) :-
    N > 1,
    N1 is N - 1,
    insert(I, N1, Tail, ResultTail).


% insert(x, 2, [a, b, c], R).
