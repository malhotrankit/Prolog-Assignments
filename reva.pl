rev([]    , []) .
rev([X|Xs], Zs) :- app(Ys, [X], Zs), rev(Xs, Ys), !.

app([]    , Qs, Qs    ) .
app([P|Ps], Qs, [P|Rs]) :- app(Ps, Qs, Rs).


mult(o, _, o).
mult(s(N), M , K) :- mult(N, M, O), add(O, M, K).


app([],Ys,Ys).
app([X|Xs],Ys,[X|Zs]) :- app(Xs,Ys,Zs).