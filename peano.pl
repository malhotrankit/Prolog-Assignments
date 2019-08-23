isPeano(o).
isPeano(s(N)) :- isPeano(N).

add(o , Y, Y).
add(s(X), Y, s(Z)) :- add(X, Y, Z).

ad(o, P, P).
ad(s(X), Y, Z) :- ad(X, s(Y), Z).

subtr(X, o, X).
subtr(s(X), s(Y), Z) :- subtr(X, Y, Z).

mult(o, _, o).
mult(s(N), M , K) :- mult(N, M, O), add(O, M, K).

firstP(o, Xs, Ys) :- !.
firstP(s(N), [X|Xs], [X|Ys]) :- firstP(N, Xs, Ys).

max(o, X, X).
max(s(X), o, s(X)). % prevents duplicate answers 
max(s(X), s(Y), s(Z)) :- max(X, Y, Z).


dropp(o, [], []).
dropp(o, [X|Xs], [X|Ys]) :- dropp(o, Xs, Ys).
dropp(s(N), [_|Xs], Ys) :- dropp(N, Xs, Ys).