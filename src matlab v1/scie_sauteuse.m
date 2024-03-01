close all; clear all;

%%%%%%%%% Etude cinématique %%%%%%%%%%

% Grandeurs géométriques
R1=2e-3; % en m
e2=9.5e-3     ;  % à compléter
R2=16.8e-3     ;  % à compléter
h0=R1+R2     ;  % à compléter


% Tracé de la loi entrée - sortie pour un aller-retour de la lame
psi1=linspace(0.2*pi*R2/R1, 100);  % définition de l'intervalle d'étude à compléter
z=h0+e2*sin(R1/R2*psi1);  % à compléter

% Tracé de la courbe avec titre, étiquettes...
plot(psi1,z);  % à compléter
grid on
title('loi entrée-sortie');  % à compléter
xlabel('\psi_1 [rad]');
ylabel('z');  % à compléter
  
%%%%%%%%%% Etude dynamique %%%%%%%%%%%

% Géométrie des masses  
B1=67.7e-6; % en kg.m2
B2=10.4e-6;  % en kg.m2 à compléter
m3=50.1e-3;  % en kg à compléter

% Actions mécaniques
g=9.81;  % en m/s2
F1=50;   %   % en N à compléter
F2=20;  % en N à compléter

%% Résolution de l'équation de mouvement avec moteur universel et effort de coupe %%

% Moteur universel
Cd=200e-3;% en Nm à compléter
wv=(2900*pi)/3;  % en rad/s à compléter

% Sauvegarde des données numériques dans la structure data
data=struct('R1',R1,'e2',e2,'R2',R2,'h0',h0,'B1',B1,'B2',B2,'m3',m3,'g',g,'F1',F1,'F2',F2,'Cd',Cd,'wv',wv);

% Définition de l'intervalle d'étude
ti=0;  % à compléter
tf=10;  % à compléter
tspan=[ti tf];  % à compléter

% Conditions initiales
Q0=[0 ; 0];  % à compléter Q0=[psi1(0); dpsi1(0)]

% Définition des tolérances sur les erreurs relatives et absolues
options = odeset('RelTol',1e-5,'AbsTol',1e-7);  

% Intégration du système differentiel
[t,Q]=ode45(@(t,Q) eq_mvt_scie_sauteuse(t,Q,data),tspan,Q0,options);
psi1=Q(:,1);  % à compléter
dpsi1=Q(:,2);  % à compléter

% Tracé de la vitesse de rotation de l'arbre d'entrée
figure;
plot(t,dpsi1,'r');      
title('Vitesse de rotation en fonction de t');
xlabel('t [s]');
ylabel('d\psi_1 [rad/s]');
grid on  ;

% Tracé du couple moteur
Cm=Cd-Cd/wv*dpsi1; % à compléter
figure;
plot(t,Cm,'r');    
title('Couple Moteur en fonction de t');
xlabel('t [s]');
ylabel('Cm [Nm]');
grid on;  

% Tracé de la vitesse de la lame
dz=e2*R1/R2*dpsi1.*cos(R1/R2*psi1); % à compléter
figure;
plot(t,dz,'r');      
title('Vitesse de la lame en fonction de t');
xlabel('t [s]');
ylabel('dz [m/s]');
grid on;  

% Tracé de la puissance
P=Cm.*dpsi1; % à compléter
figure;
plot(t,P,'r');      
title('Puissance en fonction de t');
xlabel('t [s]');
ylabel('P');
grid on; 

%{
%% Asservissement en vitesse %%
w=  ;  % en rad/s à compléter

% Couple moteur imposé avec effort de coupe Fc en fonction du temps
t=linspace(0.2*pi*R2/R1*(1/w),1000)  ;  % à compléter pour un aller-retour de la lame
dz=  ;  % à compléter
Fc=   ;  % à compléter
Cm=  ;  % à compléter

% Tracé du couple moteur
figure;

% Tracé de la puissance

%}

