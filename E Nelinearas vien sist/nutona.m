%% 14.piemērs. Ņūtona metode vienādojumu sistēmam
% ar Ņūtona metodi apgabalā 𝐷 = {0 ≤ 𝑥1 ≤ 1.5, 0 ≤ 𝑥2 ≤ 1.5} ar
% precizitāti 0.00001:

% 𝑥1^3 + 𝑥2^3 = 1,
% sin(𝑥1 + 0.1) − 𝑥2 = 0.3

clc, clearvars,format compact, close all,format longG
f1 = @(x1,x2)x1.^3+x2.^3-1;
f2 = @(x1,x2)sin(x1+0.1)-x2-0.3;
fimplicit(f1,[0 1.5 0 1.5],'r','LineWidth',3), hold on
fimplicit(f2,[0 1.5 0 1.5],'b','LineWidth',3), hold off
grid on,xlabel('x1'),ylabel('x2')
legend, title('Divu līniju krustojums')

% sistēmas atrisinājuma ģeometriskā interpretācija ir divu līniju 
% 𝑓1(𝑥1, 𝑥2) = 0 un 𝑓2(𝑥1, 𝑥2) = 0 krustpunkts. 

% turpinājums
syms x1 x2
xapp = [0.9 0.6]; xapp_pr = xapp; xpr = [x1 x2];
fun = [x1^3+x2^3-1,sin(x1+0.1)-x2-0.3]; % funkcijas
% funkcijas atvasinājumi
fun_pr = [diff(fun(1),xpr(1)) diff(fun(1),xpr(2))
 diff(fun(2),xpr(1)) diff(fun(2),xpr(2))]


% turpinājums
epsi = 10^(-5); k = 0; % iterāciju skaits
sol_norm = 1; % normas sākuma vērtība (jābūt lielākai par epsi)
while sol_norm > epsi
 for i = 1:2
 B(i,1) = -double(subs(fun(i),xpr,xapp));
 for j = 1:2
 A(i,j) = double(subs(fun_pr(i,j),xpr,xapp));
 end
 end
 xdelta = A\B; xapp = xapp+xdelta';
 c = double(subs(fun,xpr,xapp)); sol_norm =norm(c);
 k = k+1;
 M_pr(k,1:2) = xapp(1:2);
 M_pr(k,3) = sol_norm;
end
disp(['saknes tuvinājumi: ', num2str(xapp_pr(1:2))])
disp(' x1 x2 kļūdas norma')
disp(M_pr)

% turpinājums
fprintf('Atbilde. Ņūtona metode: sistēmai ir viena sakne \n' )
fprintf(' x1 = %.5f, x2 = %.5f ',M_pr(k,1:2))
fprintf('ar precizitāti 10^(-5)\n'), format


