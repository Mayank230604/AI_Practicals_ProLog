best_first(Start, Goal) :-
    best([[Start, 0]], Goal).

best([[Goal, _] | _], Goal) :- 
    write('Goal reached: '), write(Goal), nl.

best([[Current, _] | Rest], Goal) :-
    findall([Next, H], (edge(Current, Next), heuristic(Next, H)), Children),
    append(Rest, Children, NewQueue),
    sort(2, @=<, NewQueue, Sorted),
    best(Sorted, Goal).

% Example graph
edge(a, b). edge(a, c). edge(b, d).
edge(c, e). edge(d, f). edge(e, f).
heuristic(a, 5). heuristic(b, 3).
heuristic(c, 4). heuristic(d, 2).
heuristic(e, 1). heuristic(f, 0).



% best_first(a, f).
% best_first(b, f).
% best_first(c, f).