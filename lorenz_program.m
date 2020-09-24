%AUTHOR:
%Ishbel Jamieson

%DATE:
%22/05/2020

%USAGE:
%The user input is used to execute the function I wrote earlier to solve
%Lorenz equations (usinging the Runge-Kutta method for solving ODEs).
%It must, therefore, be ran in the same folder as the 'solve_lorenz.m' and
%'ode_solve_rk_adjust.m' pieces of code as they are both called upon.

%OUTPUT:
%A 3D graph of position as the system evolves in time. See the end of the
%'ode_solve_rk_adjust.m' for alternative graphs of interest.


%Getting the user's input (see below for example values):
a = input("Enter value for a: ");
b = input("Enter value for b: ");
r = input("Enter value for r: ");
st = input("Enter number of steps: ");
t2 = input("Enter final time: ");
y0 = input("Enter the initial conditions as an array: ");

%Example values to show strange attractor:
% a = 10
% b = 8/3
% r = 15
% st = 10000
% t2 = 100 
% y0 = [1;1;10]

%As we increase r from 1 to around 24, we can see the system oscillates
%around one stable solution with increasing frequency - indicating the system is
%becoming increasingly unstable. This can be corroborated by considering
%the graph of y1 against time as we can see the sytem takes a larger
%quantity of time to reach a stable solution as r increases.

%For r values above 24, the system exhibits chaotic behaviour and the
%properties of a strange attractor as it oscillates between both unstable
%nodes.

%Processing the user's time input into the form requeired by the function
t = linspace(0,t2,st);

%Calling the function to solve the Lorenz equations
y = solve_lorenz(y0,a,b,r,t);