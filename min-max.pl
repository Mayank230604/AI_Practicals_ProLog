% Define leaf node values for terminal states
value(a, 3).
value(b, 5).
value(c, 2).
value(d, 9).
value(e, 12).
value(f, 5).
value(g, 23).
value(h, 23).

% Define the game tree as node(State, Children)
node(root, [n1, n2]).
node(n1, [a, b, c]).
node(n2, [d, e, f, g]).
node(g, [h]).  % Optional deeper level

% Minimax main predicate
minimax(Node, Value) :-
    minimax(Node, max, Value).

% Base case: If it's a leaf node
minimax(Node, _, Value) :-
    value(Node, Value), !.

% Recursive case: Max player
minimax(Node, max, BestValue) :-
    node(Node, Children),
    findall(Value, (member(Child, Children), minimax(Child, min, Value)), Values),
    max_list(Values, BestValue).

% Recursive case: Min player
minimax(Node, min, BestValue) :-
    node(Node, Children),
    findall(Value, (member(Child, Children), minimax(Child, max, Value)), Values),
    min_list(Values, BestValue).


% minimax(root, Value).
% minimax(n2, Value).
