% Base simulation: angular velocity response of a simplified
% wind turbine-generator drivetrain, all parameters held constant.

J = 5;
b = 0.2;
K = 3;
Taero = 10;
dt = 0.1;
t = 0:dt:10;

omega = zeros(size(t));
omega(1) = 0;

for i = 1:length(t)-1
    Tgen = K * omega(i);
    Tdamp = b * omega(i);
    Tnet = Taero - Tgen - Tdamp;
    domega_dt = Tnet / J;
    omega(i+1) = omega(i) + domega_dt * dt;
end

plot(t, omega, "r", "LineWidth", 3)
xlabel('Time (s)')
ylabel('Angular velocity (rad/s)')
grid on
title('How Angular velocity changes with time in a simplified Wind Turbine system')
