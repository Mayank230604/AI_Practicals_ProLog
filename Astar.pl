:- use_module(library(lists)).

% edge(Node, Neighbor, Cost)
edge(a, b, 1).
edge(a, c, 3).
edge(b, d, 1).
edge(c, d, 1).
edge(d, e, 5).

% heuristic(Node, EstimateToGoal)
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 2).
heuristic(d, 1).
heuristic(e, 0).

% A* Search: astar(Start, Goal, Path, Cost)
astar(Start, Goal, Path, Cost) :-
    heuristic(Start, H),
    astar_search([node(Start, 0, [], H)], Goal, RevPath, Cost),
    reverse(RevPath, Path).

% Search: astar_search(OpenList, Goal, Path, Cost)
astar_search([node(Goal, G, PathSoFar, _)|_], Goal, [Goal|PathSoFar], G).
astar_search([node(Current, G, PathSoFar, _)|Rest], Goal, Path, Cost) :-
    findall(
        node(Next, G1, [Current|PathSoFar], F1),
        (edge(Current, Next, StepCost),
         \+ member(Next, PathSoFar),  % avoid cycles
         G1 is G + StepCost,
         heuristic(Next, H),
         F1 is G1 + H),
        Children),
    append(Rest, Children, NewOpen),
    predsort(compare_f, NewOpen, SortedOpen),  % sort by F
    astar_search(SortedOpen, Goal, Path, Cost).

% Custom comparator to sort by F-value
compare_f(Delta, node(_,_,_,F1), node(_,_,_,F2)) :-
    compare(Delta, F1, F2).


% astar(a, e, Path, Cost).
% astar(a, d, Path, Cost).
% astar(c, e, Path, Cost).