% max(+X, +Y, +U, -Z)
% Находит максимальное число из трёх
max(X, Y, U, Z):- X>Y, X>U, !.
max(_, Y, U, Y):- Y>U, !.
max(_, _, U, U).

% fact(+N, -X)
% Находит факториал числа N рекурсией вверх
fact(0, 1):- !.
fact(N, X):- N1 is N - 1, fact(N1, X1), X is X1*N.

% fact_down(+N, -X)
% Находит факториал числа N рекурсией вниз
fact_down(N, X):- fact_down(0,1,N,X).
fact_down(N,Y,N,Y):- !.
fact_down(Z,Y,N,X):- Z1 is Z+1, Y1 is Y*Z1, fact_down(Z1,Y1,N,X).

% is_square_free(+X)
% Проверяет является ли X свободным от квадратов
is_square_free(1):- !, false.
is_square_free(X):- X<1, !.
is_square_free(X):- \+is_square_free(X, 1).
is_square_free(X, N):- (X-N*N) =:= 0, !.
is_square_free(X, N):- N*N =< X, N1 is N+1, is_square_free(X, N1).

% sum_list_down(-_,?Sum)
% Вычисляет сумму или проверяет является ли Sum суммой элементов рекурсией вниз.
sum_list_down(_, Sum):- read_line_to_string(user_input, Input), split_string(Input, " ", "", List2), maplist(atom_number, List2, List), sum_list_down2(List, Sum).
sum_list_down2(List, Sum):- sum_list_down2(List, 0, Sum).
sum_list_down2([], CurSum, Sum):- Sum is CurSum, !.
sum_list_down2([HeadList|TailList], CurSum, Sum):- NewCurSum is CurSum + HeadList, sum_list_down2(TailList, NewCurSum, Sum).

% sum_list_up(-_, ?Sum)
% Вычисляет сумму или проверяет является ли Sum суммой элементов рекурсией вверх.
sum_list_up(_, Sum):- read_line_to_string(user_input, Input), split_string(Input, " ", "", List2), maplist(atom_number, List2, List), sum_list_up2(List, Sum).
sum_list_up2([], 0):- !. 
sum_list_up2([HeadList|TailList], Sum):- sum_list_up2(TailList, NewSum), Sum is NewSum + HeadList.