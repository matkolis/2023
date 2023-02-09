clc, clearvars,format compact
syms x
f = x.^4-x.^3-3.*x.^2+0.8;
fplot(f, [-20 20])
figure
fplot(f, [-5 5])
figure
fplot(f, [-2 3])
% 4 saknes redzamas.
grid on
vpasolve(f, x)
roots(f)
