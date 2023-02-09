clc, clearvars,format compact
syms x
f = 4+cos(2.*x+1)-0.5.*x;
fplot(f, [-20 20])
figure
fplot(f, [5 14])
% 3 saknes redzamas.
grid on
vpasolve(f, x)
roots(f)
