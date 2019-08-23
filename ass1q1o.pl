candidate(potter).
candidate(malfoy).
candidate(granger).
candidate(weasley).

distinct(X,Y) :- candidate(X),candidate(Y), X\=Y.

allDistinct(X,Y,Z) :- distinct(X,Y), distinct(Y,Z), distinct(X,Z). 

partOfBoard(X,Y,Z) :- X=potter, Y\=malfoy, Z\=malfoy.
partOfBoard(X,Y,Z) :- Y=potter, X\=malfoy, Z\=malfoy.
partOfBoard(X,Y,Z) :- Z=potter, X\=malfoy, Y\=malfoy.
partOfBoard(X,Y,Z) :- X=malfoy, Y\=potter, Z\=potter. 
partOfBoard(X,Y,Z) :- Y=malfoy, X\=potter, Z\=potter.
partOfBoard(X,Y,Z) :- Z=malfoy, X\=potter, Y\=potter.

malfoyIf(X,Y,_) :- Y=granger, X=malfoy.
malfoyIf(_,Y,Z) :- Y=granger, Z=malfoy.
malfoyIf(X,Y,_) :- Y\=granger, X\=malfoy.
malfoyIf(_,Y,Z) :- Y\=granger, Z\=malfoy.

weasleyIf(X,Y,_) :- X=potter, Y=weasley.
weasleyIf(X,Y,_) :- X\=potter, Y\=weasley.
weasleyIf(X,_,Z) :- X=weasley, Z=potter.
weasleyIf(X,_,Z) :- X\=weasley, Z\=potter.
weasleyIf(X,Y,_) :- Y=weasley, X=potter.
weasleyIf(X,Y,_) :- Y\=weasley, X\=potter.
weasleyIf(_,Y,Z) :- Y=weasley, Z=potter.
weasleyIf(_,Y,Z) :- Y\=weasley, Z\=potter.
weasleyIf(X,_,Z) :- Z=weasley, X=potter.
weasleyIf(X,_,Z) :- Z\=weasley, X\=potter.
weasleyIf(_,Y,Z) :- Z=weasley, Y=potter.
weasleyIf(_,Y,Z) :- Z\=weasley, Y\=potter.





