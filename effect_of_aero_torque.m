% Sweeps the aerodynamic driving torque to show its effect
% on steady-state angular velocity.

J = 5;
b = 0.2;
K = 3;
Taero_values = [5, 10, 15];
dt = 0.1;
t = 0:dt:10;

hold on
for Taero_index = 1:length(Taero_values)
    Taero = Taero_values(Taero_index);
    omega = zeros(size(t));
    omega(1) = 0;

    for i = 1:length(t)-1
        Tgen = K * omega(i);
        Tdamp = b * omega(i);
        Tnet = Taero - Tgen - Tdamp;
        domega_dt = Tnet / J;
        omega(i+1) = omega(i) + domega_dt * dt;
    end

    plot(t, omega, "LineWidth", 3)
end

legend('Taero=5', 'Taero=10', 'Taero=15')
xlabel('Time (s)')
ylabel('Angular velocity (rad/s)')
grid on
title('Effect of Aerodynamic Torque on Turbine Angular velocity')
