% Project 3

% Next steps:
% Use different values to approx.
% Try different functions to approx.
% Fix functions given.

% Input function:
%f = @(x) x^.2;
% Input stepsize:
%h =  0.1;
% Input point of examination:
%a = 1;
numberdiff((@(x) x^.2),0.1,1);

%% FUNCTION:
function outputvalue = numberdiff(f,h,a)
%Formulas for 1st row:
% NOTE2SELF: Check if left and right endpt formulas are correct.
format short % or use "long".
% Actual: f'(a) -> From assignment details.
syms x % x
df = diff(f(x));
Df = eval(subs(df, x, a));
% Forward-Difference
forward_difference = ((f(a+h))-f(a))/h;
% Backward-Difference
backward_difference = (f(a)-(f(a-h)))/h;
% Three-Point Midpoint Formula
three_pt_midpt = (1/(2*h))*(f(a+h)-f(a-h));
% For Endpoints:
% Add + h, 2h, ... when starting from left.
% Subtract -h, -2h, when starting from right.
%
% Three-Point Endpoint Formula (a - left endpoint)
three_pt_left_endpt = (1/(2*h))*((-3*f(a))+(4*f(a+h))-(f(a+2*h)));
% Three-Point Endpoint Formula (a - right endpoint)
three_pt_right_endpt = (1/(2*(-h)))*((-3*f(a))+(4*f(a-h))-(f(a-2*h)));
% Five-Point Midpoint Formula
five_pt_midpt = (1/(12*h))*(f(a-2*h)-8*f(a-h)+8*f(a+h)-f(a+2*h));
% Five-Point Endpoint Formula (a-h << left endpoint)
five_pt_left_endpt = (1/(12*(-h))*(-25*f(a)+48*f(a-h)-36*f(a-2*h)+16*f(a-3*h)-3*f(a-4*h)));   
% Five-Point Endpoint Formula (a+h >> right endpoint)
five_pt_right_endpt = (1/(12*h))*(-25*f(a)+48*f(a+h)-36*f(a+2*h)+16*f(a+3*h)-3*f(a+4*h));

% Row 1
row1 = [Df, forward_difference, backward_difference, three_pt_midpt,three_pt_left_endpt, three_pt_right_endpt, five_pt_midpt, five_pt_left_endpt, five_pt_right_endpt];  % Function w/ Formulas

% Use row1 to obtain relative error/abs. error.
row2 = abs(row1 - Df);  % Relative Error
row3 = abs(row2/Df);  % Absolute Error

% Use all three rows to produce a 3x9 matrix!!!

outputvalue = [row1; row2; row3];

end