% INTEGRANTES
% Henrique Layber

% A function that takes a, b, y1a, y2a, m, f1 and f2
% and returns the solution of the system of differential equations
% y1' = y2
% y2' = f2(x, y1, y2)
% y1(a) = y1a
% y2(a) = y2a
% using the Runge-Kutta method of order 1 (Euler's method)
% m is the number of subintervals
function [x, y1, y2] = rk1(a, b, y1a, y2a, m, f1, f2)
    % h = size of the subintervals
    h = (b - a) / m;
    x = a:h:b;
    y1 = zeros(1, m + 1);
    y2 = zeros(1, m + 1);
    y1(1) = y1a;
    y2(1) = y2a;

    for i = 1:m
        y1(i + 1) = y1(i) + h * f1(x(i), y1(i), y2(i));
        y2(i + 1) = y2(i) + h * f2(x(i), y1(i), y2(i));
    end

end
