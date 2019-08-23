and(_, false, false).
and(false, _, false).
and(true, true, true).

or(_, true, true).
or(true, _, true).
or(false, false, false).

not(true, false).
not(false, true).

example1(X, Y, Z, Res) :- and(X, Y, XaY), or(Z, false, Res).
example2(X, Y, Z, Res) :- and(X, Y, XaY), and(Y, Z, YaZ), and(YaZ, Z, YaZaZ), or(XaY, YaZaZ, Res).
example3(X, Y, Z, Res) :- not(Y, NY), and(X, NY, XaNY), and(XNY, Z, XNYaZ), and(Z, Y, ZaY), or(ZaY, Z, ZaYoZ), or(XNYaZ, ZaYoZ, Res).
