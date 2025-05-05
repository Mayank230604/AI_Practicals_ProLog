% Define neighbors (this could be any arbitrary state space, example: graph)
edge(a, b, 1).
edge(a, c, 2).
edge(b, d, 3).
edge(b, e, 2).
edge(c, f, 1).
edge(c, g, 2).
edge(d, h, 3).
edge(e, h, 2).
edge(f, h, 1).
edge(g, h, 0).

% Heuristic values: Lower is better for the goal
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 5).
heuristic(e, 3).
heuristic(f, 2).
heuristic(g, 1).
heuristic(h, 0).  % Goal state

% Find all neighbors of the current state
neighbors(State, Neighbors) :-
    findall(Neighbor, (edge(State, Neighbor, _); edge(Neighbor, State, _)), Neighbors).

% Hill climbing algorithm
hill_climb(Current, Path) :-
    hill_climb_helper(Current, [Current], Path).

hill_climb_helper(Current, Visited, Visited) :-
    heuristic(Current, 0),  % If the heuristic of Current is 0, we've reached the goal
    write('Goal reached at '), write(Current), nl.

hill_climb_helper(Current, Visited, Path) :-
    neighbors(Current, Neighbors),
    best_neighbor(Neighbors, Best),
    \+ member(Best, Visited),  % Avoid cycles
    hill_climb_helper(Best, [Best | Visited], Path).

% Find the best neighbor with the lowest heuristic value
best_neighbor([Best], Best).  % If only one neighbor, it’s automatically the best

best_neighbor([H|T], Best) :-
    heuristic(H, HVal),
    best_neighbor(T, BestTail),
    heuristic(BestTail, BestVal),
    (HVal < BestVal -> Best = H ; Best = BestTail).


% hill_climb(a, Path).
% hill_climb(b, Path).
% hill_climb(c, Path).