% Sweeps the generator resistance constant K to show its effect
% on steady-state angular velocity.

J = 5;
b = 0.2;
Taero = 10;
K_values = [1.5, 3, 5];
dt = 0.1;
t = 0:dt:10;

hold on
for K_index = 1:length(K_values)
    K = K_values(K_index);
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

legend('k=1.5', 'k=3', 'k=5')
xlabel('Time (s)')
ylabel('Angular velocity (rad/s)')
grid on
title('Effect of Generator Constant K on Turbine Angular Velocity')
