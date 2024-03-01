close all; clear all;

% Grandeurs géométriques en USI

r=2e-3; a=8.6e-3; R=18e-3; h=r+R;

% Géométrie des masses en USI

C1=67.7e-6; C2=10.4e-6; m3=50.1e-3;

% Actions mécaniques en USI

g=9.81; F1=50; F2=20;  % en N

% Moteur universel en USI

Cd=180e-3; wv=25000*2*pi/60;

% Sauvegarde des données dans la structure data

data=struct('C1',C1,'r',r,'C2',C2,'a',a,'R',R,'m3',m3,'g',g,'F1',F1,'F2',F2,'Cd',Cd,'wv',wv');

% Définition de l'intervalle d'étude

ti=0; tf=8;  tspan=[ti tf];

% Conditions initiales

Q0=zeros(2,1);  % à compléter

% Définition des tolérances sur les erreurs relatives et absolues

options = odeset('RelTol',1e-9,'AbsTol',1e-11);

% Intégration du système differentiel

[t,Q]=ode45(@(t,Q) eq_mvt_scie(t,Q,data),tspan,Q0,options);  % à compléter

psi1=Q(:,1);  % à compléter

dpsi1=Q(:,2);  % à compléter

% Tracé de la position de l'arbre d'entrée

%figure; plot(t,psi1); title('Position arbre entrée');

% Tracé de la vitesse de rotation de l'arbre d'entrée

%figure; plot(t,dpsi1); title('Vitesse arbre entrée');

% Tracé du couple moteur

Cm=Cd*(1-dpsi1/wv);

%figure; plot(t,Cm); title('Couple moteur');

% Tracé de la vitesse de la lame

dy=a*r/R.*dpsi1.*sin(-r/R.*psi1);

%figure; plot(t,dy); title('Vitesse de la lame');

% Tracé de l'effort normal Y32

Fc=-F1/2*(1+sign(dy))+F2/2*(1-sign(dy));
Cm=Cd*(1-dpsi1/wv);  % à compléter
ddpsi1 = acc(t,Q,Fc, data);
ddy=a*r/R.*ddpsi1.*sin(-r/R.*psi1)-a*r^2/R^2.*dpsi1.*dpsi1.*cos(-r/R.*psi1);
Y32=-m3.*ddy+Fc-m3*g;
figure; plot(t,Y32); title('Effort normal Y32');
