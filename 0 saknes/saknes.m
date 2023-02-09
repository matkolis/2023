clc, clearvars,format compact
syms x
f = cos(x-0.2) - x./5-0.9;
fplot(f, [-20 20])
figure
fplot(f, [-10 5])
% 5 saknes redzamas.
grid on
vpasolve(f, x)
roots(f)
