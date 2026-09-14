% Introduces proportional control on generator torque to try to
% regulate angular velocity towards a reference value.

J = 5;
b = 0.2;
Taero = 10;
Kp = 2;
omega_ref = 4;
dt = 0.1;
t = 0:dt:10;

omega = zeros(size(t));
omega(1) = 0;

for i = 1:length(t)-1
    Tgen = Kp * (omega(i) - omega_ref);
    Tdamp = b * omega(i);
    Tnet = Taero - Tgen - Tdamp;
    domega_dt = Tnet / J;
    omega(i+1) = omega(i) + domega_dt * dt;
end

plot(t, omega, "r", "LineWidth", 3)
xlabel('Time (s)')
ylabel('Angular velocity (rad/s)')
grid on
title('Angular velocity control using proportional control')
