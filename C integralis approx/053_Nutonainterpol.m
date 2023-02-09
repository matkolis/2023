%% 8.piemērs. Interpolēt integrāli ar 4.kārtas Ņūtona
% interpolācijas polinomu ar mezgliem punktos
clc, clearvars,format compact, close all
xnodes = 3.4:0.1:4.2;
syms t, y = @(t)log(1+4.*nthroot(exp(t)+2, 3)+sin(2.*t));
m = length(xnodes);
for i = 1:m
 ynodes(i) = integral(y,0,xnodes(i));
end
%disp('Funkcijas vērtības interpolācijas mezglos:')
%disp(ynodes) 

% turpinājums. Interpolēt funkciju ar 4.kār. interpolācijas polinomu
coef = ynodes;
for k = 2:m
 coef(k:m) = (coef(k:m) - coef(k-1:m-1))./...
 (xnodes(k:m) - xnodes(1:m+1-k));
end
syms x, pol = coef(m); % polinoma konstuēšana
for k = m-1:-1:1
pol = pol*(x-xnodes(k))+coef(k);
end
polyn(x) = collect(pol);
coefpol = sym2poly(polyn) % polinoma koeficienti
%{
ārēja funkcija pašā faila apakšā.
%}
fun_prob6(coefpol) % polinoma drukāšana

% turpinājums
pol_ver = double(polyn(4.03))
fprintf('Polinoma vērtība punktā(4.03) = %.4f \n',pol_ver)

% ārēja funkcija (6.piemērs). Skaitliskā integrēšana
% polinoma drukāšana
function fun_prob6(koef)
 m = length(koef);
 fprintf('\n Atbilde. \n Ņutona %.0f.kārtas',m-1)
 fprintf(' interpolācijas polinoms: \n ')
 n = m-1;
 for i = 1:m
 if koef(i) < 0
 fprintf(' %.4fx^%.0f',koef(i),n)
 else
 fprintf(' +')
 fprintf('%.4fx^%.0f',koef(i),n)
 end
 n = n-1;
 end
 fprintf('\n')
end
