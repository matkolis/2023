%% kosi ''' y'” + (3 + arctg x)y" +sqrt(1+x+x^3)y' +In(2 + x^2)y = sinx
clc, clearvars, format compact 
%--------------------------------------------
dy_dx = @(x,y) [
    y(2);
    y(3);
    x.^3./(x.^3) + ((x.^2) * y(3))./(x.^3) - (2*x * y(2))./(x.^3) + (2*y(1))./(x.^3)  
    ];                  
%--------------------------------------------

% Define value at y(lower_lim)
y0 = [5/4; 3/4; 11/2];                     

% Define interval for x
lower_lim = 1;
upper_lim = 4;
delta = 0.1;    % might be usefull later

x_int = (lower_lim:delta:upper_lim);

% Get solution by using ode45 (dont edit)
sol = ode45(dy_dx,x_int,y0);

%Define point of interest
pnt = 1.87;

% Value of y at point of interest 
y_pnt = deval(sol,pnt);

fprintf('Answer: y(%.2f) = %.4f \n ',pnt ,y_pnt(1))
fprintf("Answer: y'(%.2f) = %.4f \n ",pnt ,y_pnt(2))
fprintf("Answer: y''(%.2f) = %.4f \n ",pnt ,y_pnt(3))

% Graph if needed
x = (lower_lim : delta : upper_lim);    % x value vector
y = deval(sol,x);                       % y value vector
plot(x,y,'r','LineWidth',3), xlabel('x'), ylabel('y')
title('Funkcijas y(x) grafiks'),grid on
