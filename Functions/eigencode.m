%% Define the matrix --  that is of K or R
A = [3, sqrt(2); sqrt(2), 4]

% Calculate eigenvalues and eigenvectors   
[V, D] = eig(A)

%% V = phi and D = lambda

% Display the eigenvalues
disp('Eigenvalues:')
disp(diag(D))

% Display the eigenvectors
disp('Eigenvectors:')
disp(V)

%% state that Y= phi-transpose*X gives Ky = lambda = the matrix

%% transpose code
% Given matrix
%--A = [2, 3; 1, 0];

% Transpose of the matrix
%--A_transpose = A';

% Display the result
%--disp('Original Matrix:');
%--disp(A);

%--disp('Transpose:');
%--disp(A_transpose);


%% state that C = Z*phi-transpose Z which is lambda^-1/2(sqrt of inverse of lambda)

% Define the matrix  
A = [5, 0; 0, 2]

% Find the inverse
A_inv = sqrt(inv(A));

% Display the result
disp('Original Matrix:');
disp(A);

disp('Inverse Matrix:');
disp(A_inv);

%% if C inverse is not equal to Ctranspose then C is  not unitary