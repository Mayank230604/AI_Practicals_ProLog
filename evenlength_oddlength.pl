% Base case: an empty list has even length
evenlength([]).

% If removing two elements gives an even list, then it's even
evenlength([_,_|Tail]) :-
    evenlength(Tail).

% A list with one element has odd length
oddlength([_]).

% If removing two elements gives an odd list, then it's odd
oddlength([_,_|Tail]) :-
    oddlength(Tail).


% evenlength([a, b, c, d]).
% oddlength([1, 2, 3]).

