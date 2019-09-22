% Project 4

%% INTRODUCTION:

% Input function:
% f = @(x) x^.2;
% Input number of subintervals:
% n =  10;
% Input endpts of integral for examination:
% a = 1; b=11;

% GOAL:
% We want the output result of performing Romberg integration with n
% function evaluations to approximate:
% integral(a,b,f).
% That is, should output what the book calls Rn,n for integral(a,b,f).

% Assume a<b, and that input function f is defined everywhere on [a,b].
% May also assume that f is vectorized.

%% ENTER INPUTS.

% a = 1;
% b = 11;
% n = 2;
% f = @(x) x.^2-1/3;
% Or even create subfunction:
% eval=romberg(@myfunc,0,1,5);          
% here 'myfunc' is any user-defined function in M-file

%% Call function:

romberg(a,b,n,f);


%% ROMBERG FUNCTION
function R = romberg(a,b,n,f)
% format long - Scaled fixed point format, with 15 digits for double; 7 digits for single.
h = (b - a) ./ (2.^(0:n-1));    % Step Size
% Set up Romberg Integration:
% Initialize:
r = zeros(n,n); % Matrix of all zeros.
r(1,1) = (b - a) * (f(a) + f(b)) / 2;   
% 
for j = 2:n
    sum = 0;
    for i = 1:2^(j-2)
        sum = sum + f(a + (2 * i - 1) * h(j));
    end
    r(j,1) = r(j-1,1) / 2 + h(j) * sum;
    for k = 2:j
        r(j,k) = (4^(k-1) * r(j,k-1) - r(j-1,k-1)) / (4^(k-1) - 1);
    end
R=r(n,n); % Matrix contain approx. using Romberg integration.
end
end