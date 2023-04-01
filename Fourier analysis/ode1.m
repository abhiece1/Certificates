tspan = [0 10];
y0 = 0;
[t,y] = ode45(@(t,y) 10*sin(t), tspan, y0);
plot(t,y);