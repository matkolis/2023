%{
 simetriskā un pozitīvi definēta matrica
Izmantojot sākuma tuvinājumu 𝒙^(0),
 katrā iterācijas solī aprēķina
            ( 𝒓^(𝑛), 𝐴𝒓^(𝑛) )
𝜏(𝑛+1) =----------------------
                ‖𝐴𝒓^(𝑛)‖^2 
Nākamo tuvinājumu atrisinājumam iegūst:
𝒙^(𝑛+1) = 𝒙^(𝑛) − 𝜏(𝑛+1)𝒓^(𝑛)
%}

%% 10.piemērs. Minimālās nesaistes metode
clc, clearvars, format compact
A = [4 2 4
2 16 1
4 1 8]; B = [1
-2
3];
if det(A) == 0
 disp('Matrica A ir singulārā ')
 disp(' Atbilde: minimālo nesaistes metodi nedrīkst izmantot')
 return
end
disp('Matrica A ir nesingulārā ')

%{
ārēja funkcija pašā faila apakšā.
%}
ni = fun_prob10(A); % pārbaude vai matrica ir pozitivā definēta
if ni == 2
 disp('Koeficientu matrica nav pozitīvi definēta')
 disp(' Atbilde: minimālo nesaistes metodi nedrīkst izmantot')
 return
end
check=isequal(A,A');
if check==0
 disp('Koeficientu matrica nav simetriskā')
 disp(' Atbilde: minimālo nesaistes metodi nedrīkst izmantot')
 return
end
disp('Koeficientu matrica ir simetriskā un pozitīvi definēta ')

% turpinājums
k_iter = 0; epsi = 10^(-3);itermax =8;
n = length(B);
x_app=zeros(n,1);
r = A*x_app-B; norm_r = norm(r);
while norm_r > epsi && k_iter < itermax
 k_iter =k_iter+1;
 tau = ((A*r)'*r)/norm(A*r)^2;
 x_app = x_app-(tau*r')';r = A*x_app-B; norm_r = norm(r);
end
norm(x_app)
%k_iter,tau, x_app, norm_r
% Vienādojumu sistēmas precīzs atrisinājums
%x_sol = linsolve(A,B)
% turpinājums
%disp('Atbilde:')
%fprintf(' iter. skaits = %.f, nesaistes norma = %.8f\n', k_iter,norm_r)
%disp([' x_tuvinājumi : {' num2str(x_app(:)') '}'])


%% ārēja funkcija( 10.piemērs ) Minimālās nesaistes metode
% pārbaude: vai matrica ir pozitīvi definēta
function ni = fun_prob10(A_mat)
 ni = 1;
 [row,col] = size(A_mat);
 for i = 1:row
 if det(A_mat(1:i,1:i))>0
 else ni = 2; break
 end
 end
end
