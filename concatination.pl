% Base case: Concatenating an empty list with any list gives the second list.
conc([], L2, L2).

% Recursive case: If the first list is not empty, take the head of L1
% and append it to the result of concatenating the tail of L1 with L2.
conc([Head|Tail], L2, [Head|Result]) :-
    conc(Tail, L2, Result).


% conc([1, 2, 3], [4, 5, 6], Result).
% conc([], [7, 8, 9], Result).
% conc([1, 2, 3], [], Result).