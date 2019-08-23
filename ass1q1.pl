candidate(potter).
candidate(malfoy).
candidate(weasley).
candidate(granger).

board(X, Y, Z) :- candidate(X), candidate(Y), candidate(Z), X \= Y, Y \= Z, X \= Z.

partOfBoard(A, X, Y, Z) :- A = X.
partOfBoard(A, X, Y, Z) :- A = Y.
partOfBoard(A, X, Y, Z) :- A = Z.

notPartOfBoard(A, X, Y, Z) :- A \= X, A \= Y, A \= Z.

potterOrMalfoy(X, Y, Z) :- partOfBoard(potter, X, Y, Z), notPartOfBoard(malfoy, X, Y, Z).
potterOrMalfoy(X, Y, Z) :- partOfBoard(malfoy, X, Y, Z), notPartOfBoard(potter, X, Y, Z).

malfoyAvail(X, Y, Z) :- partOfBoard(malfoy, X, Y, Z), X = granger.
malfoyAvail(X, Y, Z) :- notPartOfBoard(malfoy, X, Y, Z).

weasleyAvail(X, Y, Z) :- partOfBoard(potter, X, Y, Z), partOfBoard(weasley, X, Y, Z).
weasleyAvail(X, Y, Z) :- notPartOfBoard(weasley, X, Y, Z).

potterAvail(X, Y, Z) :- partOfBoard(potter, X, Y, Z), Z \= granger.
potterAvail(X, Y, Z) :- notPartOfBoard(potter, X, Y, Z).

grangerAvail(X, Y, Z) :- partOfBoard(granger, X, Y, Z), X \= weasley.
grangerAvail(X, Y, Z) :- notPartOfBoard(granger, X, Y, Z).

