%% 1.uzd Jakobi
clc, clearvars, format compact, format short 
A=[5 1 2 -1
2 6 -1 3
2 -1 7 4
1 2 3 8]; B=[5
4
1
9];
if det(A) == 0
    disp('Matrica A ir singulârâ ')
    disp(' Atbilde:  Jakobi metodi nedrîkst izmantot'), return
end
disp('Matrica A ir nesingulârâ ')
fun_prob3(A) % pârbaude: vai Jakobi metode konverìç?

% turpinâjums 
n = length(B);
x_app = zeros(n ,1); itermax = 7; k = 1; 
x_app = [1
-1
-1
1];
errnorm =1; prnorm =zeros(1,2);
for iter = 1:itermax
 k = k+1;
 for i = 1:n 
 res_sum = 0;
 for j =1 :n 
 if j~=i
 res_sum = res_sum + x_app(j,k-1)*A(i,j);
 end
 end
 x_app(i,k) =(B(i,1)- res_sum)/A(i,i);
 end
 errnorm =norm((x_app(:,k)-x_app(:,k-1)),2);
 prnorm(iter,:) =[iter,errnorm];
end
norm(x_app)
%disp('x4 9. iterācijā')
%x_app(4,10)
% x_app
%{
disp('Iterācijas Kļūda')
disp(prnorm)
x_approx = x_app(:,k);
%}

%X = linsolve(A,B);
%X(4)
%sol_X12_norm = norm(X-x_app(:,13))

%X = linsolve(A,B)
%sol_X12_norm = norm(X - x_app(:, itermax+1)) % 4 skaitli aiz komata


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
