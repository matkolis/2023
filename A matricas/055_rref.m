%% rref
clc, clearvars, format compact
A = [3 -1 2 1
    4 2 0 3
    1 7 5 2];
B = [1
    4
    2];
[row,col] = size(A)
Aaug = [A B]; % divu matricu apvienojums
%A_rank = rank(A) % matricas rangs
%Aaug_rank = rank(Aaug) % paplašinātās matricas rangs
C = rref(Aaug) % Ctrl+Enter
C(3,4)