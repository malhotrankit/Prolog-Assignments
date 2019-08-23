add(o , Y, Y).
add(s(X), Y, s(Z)) :- add(X, Y, Z).

mult(o, _, o).
mult(s(N), M, K) :- mult(N, M, O), add(O, M, K).

subtr(X, o, X).
subtr(s(X), s(Y), Z) :- subtr(X, Y, Z).


riders(Heads, Legs, X, Y) :- add(X, Y, Heads), mult(X, s(s(o)), P), mult(Y, s(s(s(s(o)))), Q), add(P, Q, Legs).