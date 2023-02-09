%% 14.piemērs.Hoļecka metode
clc, clearvars, format compact
A = [7 2 3 -1
    2 5 1 5
    3 1 9 3
    -1 5 3 16];


check = isequal(A,A'); % pārbaude: vai matrica ir simetriskā
if check == 0 % check = 1(TRUE) vai check = 0(FALSE)
 disp('Koeficientu matrica nav simetriskā')
 disp('Atbilde: Hoļecka metodi nedrīkst izmantot'), return
end
%{
atkal mistiskie 1,2 true/false vietā...
%}
ni = fun_prob14(A); % pārbaude: vai matrica ir pozitīvi definēta
if ni == 2
 disp('Koeficientu matrica nav pozitīvi definēta')
 disp('Atbilde: Hoļecka metodi nedrīkst izmantot'), return
end
disp(' Koeficientu matrica ir simetriskā un pozitīvi definēta ')

% turpinājums
L = chol(A,'lower')
%Amat = L*L' % matrica A
%Y = L\B % vai Y=linsolve(L,B)
%X = L'\Y % vai X=linsolve(L%,Y)
% Ctrl+Enter
% turpinājums
disp('Atbilde:')
L
L(2, 2)
%fprintf(' x1 = %.0f; x2 = %.0f; x3 = %.0f\n',X)


% ārēja funkcija ( 14.piemērs ). Holecka metode
% pārbaude: vai matrica ir pozitīvi definēta
function ni = fun_prob14(A_mat)
 ni = 1;
 [row,col] = size(A_mat);
 for i = 1:row
 if det(A_mat(1:i,1:i))>0
 else ni = 2; break
 end
 end
end