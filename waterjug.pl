% Initial state: both jugs are empty
:- discontiguous solve/0.

start(state(0, 0)).

% Goal state: 2 liters in Jug A
goal(state(2, _)).

% Define possible moves
move(state(A, B), state(4, B), 'Fill Jug A') :- A < 4.
move(state(A, B), state(A, 3), 'Fill Jug B') :- B < 3.
move(state(A, B), state(0, B), 'Empty Jug A') :- A > 0.
move(state(A, B), state(A, 0), 'Empty Jug B') :- B > 0.

% Pour A -> B
move(state(A, B), state(NewA, NewB), 'Pour A to B') :-
    A > 0, B < 3,
    Transfer is min(A, 3 - B),
    NewA is A - Transfer,
    NewB is B + Transfer.

% Pour B -> A
move(state(A, B), state(NewA, NewB), 'Pour B to A') :-
    B > 0, A < 4,
    Transfer is min(B, 4 - A),
    NewA is A + Transfer,
    NewB is B - Transfer.

% Main solve predicate with visited states
solve :-
    start(Start),
    goal(Goal),
    dfs(Start, Goal, [Start], Moves),
    print_moves(Moves).

% Depth-first search
dfs(State, State, _, []).
dfs(Current, Goal, Visited, [Action | Moves]) :-
    move(Current, Next, Action),
    \+ member(Next, Visited),  % avoid cycles
    dfs(Next, Goal, [Next | Visited], Moves).

% Print steps
print_moves([]) :- write('Solved!'), nl.
print_moves([Step | Rest]) :-
    write(Step), nl,
    print_moves(Rest).
 solve.

% solve.