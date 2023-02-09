%% 8.piemērs. Sekantu metode( Atrast vismazāko pozitīvo skaitli )
%  minimālo pozitīvo skaitli a , kas apmierina vienādojumu
% ∫ √(2 + 𝑎𝑥^4) sin(𝑥^2) 𝑑𝑥 = 5
% (precizitāte 𝜀 = 0.000001 ).

clc, clearvars,format compact, close all, format longG
integ = @(a,x)(2+a.*x.^4).^(1/2).*sin(x.^2);
for a = 1:10
 fun = @(x)integ(a,x);
 int_val(a) = integral(fun,2,4)-5;
end
a_pr = 1:10; plot(a_pr,int_val,'r','LineWidth',3)
title(['Funkcijas f(a) grafiks intervālā [1 10]'])

% turpinājums
for a = 11:20
 fun = @(x)integ(a,x);
 int_val(a) = integral(fun,2,4)-5;
end
figure
a_pr = 11:20; plot(a_pr,int_val(11:20),'r','LineWidth',3)
title(['Funkcijas f(a) grafiks intervālā [11 20]'])
xlabel('a'),ylabel('f(a)'),grid on

% turpinājums
iter = 6; a_xn = zeros(1,iter+2);
a_xn = [14 14.5];
for i = 1:2
 fun = @(x)integ(a_xn(i),x); f(i) = integral(fun,2,4)-5;
end
for k = 1:iter
 k1 = k+1; i = k+2;
 a_xn(i) = a_xn(k1)-f(k1)*(a_xn(k1)-a_xn(k))/(f(k1)-f(k));
 fun = @(x)integ(a_xn(i),x); f(i) = integral(fun,2,4)-5;
 M_pr(k,1) = a_xn(i); M_pr(k,2) = f(i);
end
disp(['skaitļa a tuvinājumu intervāls: ', num2str(a_xn(1:2))])
disp(' a f(x)')
disp(M_pr)

% turpinājums
fprintf('Atbilde. Sekantu metode - vismazākā pozitīva skaitļa \n' )
fprintf(' a = %.6f ar precizitāti 10^(-6)\n',M_pr(iter,1))
format
