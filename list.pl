% Searching for an element in list.
searchList(Item, [Item|Tail]) :- !.
searchList(Item, [Head|Tail]) :- searchList(Item, Tail).


% Merging of two lists.
merge([], List2, List2).
merge([Head|List1], List2, [Head|Res]) :- merge(List1, List2, Res).


% Count number of times an element occurs in list.
count([], Ele, 0).
count([Ele|List], Ele, Counter) :- count(List, Ele, Counter1), Counter is Counter1+1.
count([Head|List], Ele, Counter) :- count(List, Ele, Counter).


% Adding an element to list without duplication
addEle([], Ele, [Ele|[]]).
addEle([Ele|List], Ele, [Ele|List]) :- !.
addEle([Head|List], Ele, [Head|Res]) :- addEle(List, Ele, Res).


% Deletion of all occurences of an element.
deleteEle(Ele, [], []) :- !.
deleteEle(Ele, [Ele|List], Res) :- deleteEle(Ele, List, Res), !.
deleteEle(Ele, [Head|List], [Head|Res])  :- deleteEle(Ele, List, Res).


% Only first Occurence is removed.
onlyFirst(Ele, [], []).
onlyFirst(Ele, [Ele|List], List) :- !.
onlyFirst(Ele, [Head|List], [Head|Res]) :- onlyFirst(Ele, List, Res).


% Last element of a list.
lastEle([Head|[]], Head) :- !.
lastEle([Head|Tail], Res) :- lastEle(Tail, Res).


% Reversing a List
rev([]    , []) .
rev([X|Xs], Zs) :- merge(Ys, [X], Zs), rev(Xs, Ys), !.


reverse2(Xs,Zs) :- reverseAcc(Xs,[],Zs).
reverseAcc([],Ys,Ys).
reverseAcc([X|Xs],Ys,Zs) :- reverseAcc(Xs,[X|Ys],Zs).


% Element at Kth position.
eleK([Ele|List],1,Ele).
eleK([X|List],I,Res) :- I1 is I-1, eleK(List,I1,Res).


% Find out whether a list is a palindrome.
pali(Xs) :- reverse(Xs,Ys), check(Xs,Ys).
check([], []).
check([X|Xs],[X|Ys]) :- check(Xs,Ys).


% Remove the K'th element from a list.
rmvK(1, [X|Xs], Xs).
rmvK(I, [X|Xs], [X|Ys]) :- I1 is I-1, rmvK(I1,Xs,Ys).


% nodup(L) checks whether a list contains duplicates.
nodup([X|Xs]) :- checkd(Xs, X).
checkd([],_).
checkd([Head|List], X) :- \+ searchList(X, [Head|List]), checkd(List, Head).


% remove(X,Xs,Ys){.prolog} holds if removing all occurrences of X{.prolog} from the list Xs{.prolog} is equal to the list Ys.
rmvA(X, Xs, Ys) :- deleteEle(X, Xs, Res), \+ Ys \= Res.


% nub(L,R) holds if R is the list L without duplicates.
nub([Head|L], R) :- deleteEle(Head, L, Res), nub(L, R), \+ Res \= R. 