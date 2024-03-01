% Définition des constantes en USI
r=2e-3; R=18e-3; a=8.6e-3; m3=50.1e-3; C1=67.7e-6; C2=10.4e-6; g=9.81; Fc=-50;  Cm=0.3;

% Définition des positions, vitesses, accélérations en USI
psi1=7.07; dpsi1=20.6; ddpsi1=80.2;

  % Valeurs des termes M et f0
M=C2*(r^2/R^2)+C1+a^2*(r^2/R^2)*m3*sin(-r/R*psi1)*sin(-r/R*psi1)% à compléter
f0=r/R*a^2*sin(-r/R*psi1)*m3*r^2/R^2*dpsi1^2*cos(-r/R*psi1)+a*r/R*sin(-r/R*psi1)*Fc-r/R*a*sin(-r/R*psi1)*m3*g
