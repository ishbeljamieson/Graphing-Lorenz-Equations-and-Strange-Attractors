function [y] = solve_lorenz(y0,a,b,r,t)
%AUTHOR:
%Ishbel Jamieson

%DATE:
%21/05/2020

%USAGE:
%Solves Lorenz equations using the ODE solver.

%INPUT:
% y0: The initial conditions of y1, y2 and y3 in a [3,1] column vector.
% a,b,r: The coefficients in the Lorenz equations.
% t: N time steps at which yi is measured.

%OUTPUT:
% y: A [3,N] matrix of yi at each timestep.

%EXAMPLE USE:
% >> solve_lorenz([1;1;1],10,8/3,15,linspace(0,10,1000))

%Using the anonymous function to create an array of functions (the Lorenz
%equations)
f = @(t, yc)[a*(yc(2)-yc(1)); r*yc(1) - yc(2) - yc(1).*yc(3); yc(1).*yc(2) - b*yc(3)]

%Implementing the ODE solver.
y = ode_solve_rk_adjust(f,y0,t);

end

