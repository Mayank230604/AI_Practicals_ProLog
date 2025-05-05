% Base case: any number raised to the power 0 is 1
power(_, 0, 1).

% Recursive case: Num^Pow = Num * Num^(Pow - 1)
power(Num, Pow, Ans) :-
    Pow > 0,
    P1 is Pow - 1,
    power(Num, P1, Temp),
    Ans is Num * Temp.


% power(2, 3, Ans).
% power(5, 0, Ans).