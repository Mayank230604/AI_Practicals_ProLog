% Facts: gender
male(john).
male(paul).
male(mike).
male(david).

female(mary).
female(susan).
female(linda).
female(anna).

% Facts: parent(Child, Parent)
parent(paul, john).
parent(paul, mary).
parent(susan, john).
parent(susan, mary).
parent(mike, paul).
parent(anna, paul).
parent(linda, susan).
parent(david, susan).

% X is the father of Y
father(Y, X) :- parent(Y, X), male(X).

% X is the mother of Y
mother(Y, X) :- parent(Y, X), female(X).

% X and Y are siblings
sibling(X, Y) :-
    parent(X, P),
    parent(Y, P),
    X \= Y.

% X is a brother of Y
brother(X, Y) :-
    sibling(X, Y),
    male(X).

% X is a sister of Y
sister(X, Y) :-
    sibling(X, Y),
    female(X).

% X is the grandfather of Y
grandfather(Y, X) :-
    parent(Y, P),
    father(P, X).

% X is the grandmother of Y
grandmother(Y, X) :-
    parent(Y, P),
    mother(P, X).

% X is a child of Y
child(X, Y) :- parent(X, Y).

% X is a grandchild of Y
grandchild(X, Y) :-
    parent(X, P),
    parent(P, Y).

% X is an uncle of Y
uncle(Y, X) :-
    parent(Y, P),
    brother(X, P).

% X is an aunt of Y
aunt(Y, X) :-
    parent(Y, P),
    sister(X, P).

% father(paul, X).
% mother(paul, X).
% sibling(paul, X).