
%% 2.jaut. Vienkāršā iterāciju metode
% Pieņemt optimālo parametra tau vērtību
clc, clearvars, format compact
A =[8 7 9 15
    7 16 16 2
    9 16 256 10
    15 2 10 48]; B =[3
    4
    6
    8];
if det(A) == 0
 disp('Matrica A ir singulārā ')
 disp(' Atbilde: vienkāršo iterāciju metodi nedrīkst izmantot')
 return
end
disp('Matrica A ir nesingulārā ')
ni = fun_prob5(A); % pārbaude vai matrica ir pozitivā definēta
if ni == 2
 disp('Koeficientu matrica nav pozitīvi definēta')
 disp(' Atbilde: vienkāršo iterāciju metodi nedrīkst izmantot')
 return
end
check=isequal(A,A');
if check==0
 disp('Koeficientu matrica nav simetriskā')
 disp(' Atbilde: vienkāršo iterāciju metodi nedrīkst izmantot')
 return
end
disp('Koeficientu matrica ir simetriskā un pozitīvi definēta ')
% Ctrl+Enter

% turpinājums
lennB = length(B);
x_app = zeros(lennB,1); epsi = 10^(-3); itermax = 19;
x_app=[1
    0
    -1
    3];
lambda = eig(A); tau_opt = 2/(max(lambda)+min(lambda)); % 𝜏𝑜 =2/(𝜆𝑚𝑎𝑥 + 𝜆𝑚𝑖n)
k_iter = 0; resid = B-A*x_app;
while norm(resid) > epsi && k_iter < itermax
 x_app = x_app+tau_opt*resid;
 resid = B-A*x_app;
 k_iter = k_iter +1;
end
%tau_opt, k_iter, x_app % Ctrl+Enter
x_sol=linsolve(A,B) ;
%19. tātad saglabāts jau
%haha nekā atšķiras gan
X_app19_norm1 =norm(x_sol-x_app)
X_app19_norm2 =norm(x_sol)-norm(x_app)
%{
%tuvinātā atrisinājuma norma ||x(12)||
X_app5_norm =norm(x_app)
%}
disp('tātad otrais jāņem.')
%{
% turpinājums
disp('Atbilde:')
disp([' iter. skaits = ' num2str(k_iter) ])
disp([' x_tuvinajumi = {' num2str(x_app(:)') '}'])
disp([' optimāla parametra tau vērt. = ' num2str(tau_opt)])
%}



%-----------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------------

%% ārēja funkcija( 5.piemērs ) Vienkāršā iterāciju metode
% pārbaude: vai matrica ir pozitīvi definēta
function ni = fun_prob5(A_mat)
 ni = 1;
 [row,col] = size(A_mat);
 for i = 1:row
 if det(A_mat(1:i,1:i))>0
 else ni = 2; break
 end
 end
end

% ârçja funkcija ( 3.piemçrs ). Jakobi metode
% pârbaude: vai Jakobi metode konverìç?
function fun_prob3(A_mat)
 [row,col] = size(A_mat);
 for i = 1:row
    sum =0;
    for j = 1:col
        if i~=j
            sum =sum+abs(A_mat(i,j));
        end
    end
    if abs(A_mat(i,i)) <= sum
      disp(' Neizpildâs konverìences pietiekamais nosacîjums')
      fprintf(' rindas numurs %.0f: --> %.0f < %.0f \n', i,A_mat(i,i),sum ) 
      return
    end
 end
 disp(' Izpildâs konver.pietiekamais nosacîjums - Jakobi metode konverìç')
end




