%% 1.uzd Jakobi
clc, clearvars, format compact, format short 
A=[10 7 -1;9 7 2;3 -4 5]; B=[8;-3;2];
if det(A) == 0
    disp('Matrica A ir singulârâ ')
    disp(' Atbilde:  Jakobi metodi nedrîkst izmantot'), return
end
disp('Matrica A ir nesingulârâ ')
fun_prob3(A) % pârbaude: vai Jakobi metode konverìç?

% turpinâjums 
n = length(B);
x_app = zeros(n ,1); itermax = 12; k = 1; 
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
disp('Iterācijas Kļūda')
disp(prnorm)
x_approx = x_app(:,k);

X = linsolve(A,B);
sol_X12_norm = norm(X-x_app(:,13))

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