move(1, Source, Destination, _) :-
    write('Move disk 1 from '), write(Source),
    write(' to '), write(Destination), nl.

move(N, Source, Destination, Auxiliary) :-
    N > 1,
    N1 is N - 1,
    move(N1, Source, Auxiliary, Destination),
    write('Move disk '), write(N), write(' from '),
    write(Source), write(' to '), write(Destination), nl,
    move(N1, Auxiliary, Destination, Source).


% move(3, left, right, center).
% move(2, left, center, right).
% move(2, left, center, right).