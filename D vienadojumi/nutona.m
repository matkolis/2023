%% 3.piemers. Ņūtona metode
% 𝑥^3 − 2𝑥 − 5 = 0 sakni ar precizitāti 0.00001
clc, clearvars,format compact, close all, format longG
f = @(x)exp(sin(x))-x.^2+2;
x_pr = -10:0.01:10; plot(x_pr,f(x_pr),'r','LineWidth',3)
grid on, title('Funkcijas f(x) grafiks intervālā [-10,10]') 

% izrādījās -10.. 10 pa lielu intervāls, grūti sakni saskatīt..

% turpinājums
figure, x_pr = -3:0.01:3; plot(x_pr,f(x_pr),'r','LineWidth',3)
grid on, title('Funkcijas f(x) grafiks intervālā [-3,3]')

% turpinājums
x_app = 4; % saknes tuvinājumi
iter = 2; % maksimālais iterāciju skaits
syms x, fpr(x) = diff(f(x),x);
xn = x_app; M = zeros(iter,2);
for i = 1:iter
 xn = xn-f(xn)/double(fpr(xn));
 M(i,1) = xn; M(i,2) = f(xn);
end
%{
disp(['saknes tuvinājums: ',num2str(x_app(:))])
disp(' x f(x)')
disp(M)
%}

% turpinājums
fprintf('Atbilde. Ņūtona metode: vienādojumam ir viena sakne \n' )
fprintf('x = %.4f ar precizitāti 10^(-4)\n',M(iter,1))
format