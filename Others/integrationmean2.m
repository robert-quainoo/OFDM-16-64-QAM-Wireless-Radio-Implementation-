% Constants
w = 2*pi; % Adjust the value of w accordingly
t = 0;    % Adjust the value of t accordingly

% Define the function to be integrated
fun_real = @(A, B) (A * cos(w * t) + B * sin(w * t)).^2;
fun_imag = @(A, B) 0; % The imaginary part is 0 in this case

% Define the joint density function
fAB = @(A, B) 2.25 * A.^2 .* B.^2;

% Define the integration limits
A_lower = -1;
A_upper = 1;
B_lower = -1;
B_upper = 1;

% Numerical integration using integral2
expected_real = integral2(@(A, B) fun_real(A, B) .* fAB(A, B), A_lower, A_upper, B_lower, B_upper);
expected_imag = integral2(@(A, B) fun_imag(A, B) .* fAB(A, B), A_lower, A_upper, B_lower, B_upper);

% Combine real and imaginary parts to get the overall expected value
expected_value = expected_real + expected_imag;

% Display the result
disp('Expected Mean of (Acoswt + jBsinwt)^2:');
disp(expected_value);
