%{
𝐴 ir 𝒎 × 𝒎 matrica. Ja 𝐴 nav singulārā, tad to var vienā vienīgā veidā uzrakstīt
kā reizinājumu
 𝑨 = 𝑸𝑹, 
%}
%% 15.piemērs.QR dekompozīcija ( atstarošanās metode )
clc, clearvars, format compact
A = [1,2,6;2,7,3;6,3,64]; B = [7;2;13];
if det(A) == 0
 disp('Matrica A ir singulārā ')
 disp(' Atbilde: astarošanas metodi nedrīkst izmantot'), return
end
disp disp('Matrica A ir nesingulārā')
[Q,R] = qr(A)
Amat =  abs(Q*R)
X = inv(R)*inv(Q)*B
% turpinājums
disp('Atbilde:')
fprintf(' x1 = %.0f; x2 = %.0f; x3 = %.0f\n',X)