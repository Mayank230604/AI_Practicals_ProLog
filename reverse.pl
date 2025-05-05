% Base case: The reverse of an empty list is an empty list.
reverse([], []).

% Recursive case: Reverse the tail of the list, then append the head to the reversed tail.
reverse([Head|Tail], Reversed) :-
    reverse(Tail, ReversedTail),
    append(ReversedTail, [Head], Reversed).


% reverse([1, 2, 3, 4], R).
% reverse([], R).
% reverse([a, b, c, d], R).