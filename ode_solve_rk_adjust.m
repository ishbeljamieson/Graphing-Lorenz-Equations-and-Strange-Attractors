function [y] = ode_solve_rk_adjust(f, y0 , t)
%AUTHOR:
%Ishbel Jamieson

%DATE:
%21/05/2020

%USAGE:
%Solves an ODE problem using the 4th order Runge-Kutta algorithm, adjusted
%for the input of an array of functions.

%INPUT:
% f: An array of functions that returns the derivative of the state of yi
%    with respect to the current time, t.
% y0: The inital state of the system in an (Mx1) column matrix.
% t: The time steps corresponding to the values of y, in a vector
%    of size N.

%OUTPUT:
% y: An (MxN) matrix with the value of each element of y at each timestep

%EXAMPLE USE:
% >> a = 10;
% >> b = 8/3;
% >> r = 15;
% >> ode_solve_rk_adjust(@(t, yc)[a*(yc(2)-yc(1)); r*yc(1) - yc(2) - yc(1).*yc(3); yc(1).*yc(2) - b*yc(3)], [1;1;1], linspace(0,10,1000))

%FUNCTION:

%Determinging the time step
ts = t(2) - t(1);

%Determining the number of time samples we must take (n) and for how mnay
%y elements (n2)
nv = size(t);
n = nv(2);

y0v = size(y0);
n2 = y0v(1);

%Creating the y output that we will fill
y = zeros(n2, n);

%Setting the initial conditions
y(:,1) = y0;

%Looped so we fill from the 2nd to the nth column (as we have been given
%the first column already)
for in = 1:(n-1)
        %Just a vector version of the 4th order Runge-Kutta method
        k1 = f(t(in), y(:,in));
        k2 = f(t(in) + 0.5*ts, y(:,in) + 0.5*ts*k1);
        k3 = f(t(in) + 0.5*ts, y(:,in) + 0.5*ts*k2);
        k4 = f(t(in) + ts, y(:,in) +     ts*k3);
        
        y(:,in+1) = y(:,in) + ts*(1/6)*(k1 + 2*k2 + 2*k3 + k4);
end

%A 3D plot of the yi values at each time.
plot3(y(1,:),y(2,:),y(3,:));

%ALTERNATIVE PLOTS OF INTEREST:

%y1 against t (useful for r < 24 to show time taken to return to stablity):
%plot(t, y(1,:))

%y2 against y3 (useful to show the effects of errors for r > 24):
%plot(y(3,:), y(2,:));

end

