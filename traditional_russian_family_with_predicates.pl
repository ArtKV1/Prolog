
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(artur).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(artur, boguslav).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

men :- man(X), write(X), nl, fail.

women :- woman(X), write(X), nl, fail.

%children(+X) - униф (-X) - неуниф (?X) - или то или то
children(X) :- parent(X, Y), write(Y), nl, fail.

%children2(+X1, +X2)
%children2(X1, X2) :- parent(X1, Y), parent(X2, Y), man(X1), woman(X2), write(Y), nl, fail.

%mother(+X, +Y)
mother(X, Y) :- parent(X, Y), woman(X).

%mother(+X)
mother(X) :- parent(Y, X), woman(Y), write(Y), fail.

%brother(+X, +Y)
brother(X, Y) :- parent(X1, X), parent(X1, Y), man(X), not(X==Y).

%brothers(+X)
brothers(X) :- setof(t, brother(Y, X), _), write(Y), fail.

%b_s(+X, +Y)
b_s(X, Y) :- parent(X1, X), parent(X1, Y), not(X==Y).

%b_s(+X)
b_s(X) :- setof(t, b_s(X, Y), _), write(Y), nl, fail.

%father (+X, +Y)
father(X, Y) :- parent(X, Y), man(X).

%father(+X)
father(X) :- parent(Y, X), man(Y), write(Y), fail.

%grand_pa(+X, +Y)
grand_pa(X, Y) :- parent(X, X1), parent(X1, Y), man(X).

%grand_pas(+X)
grand_pas(X) :- grand_pa(Y, X), write(Y), nl, fail.

grand_pa_and_son(X,Y) :- grand_pa(X,Y); parent(X1, X), parent(Y, X1), man(X), man(Y).

%uncle(+X, +Y)
uncle(X, Y) :- parent(X1, Y), parent(X2, X1), parent(X2, X), not(X1==X), man(X).
