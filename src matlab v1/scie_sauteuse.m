close all; clear all;

%%%%%%%%% Etude cin�matique %%%%%%%%%%

% Grandeurs g�om�triques
R1=2e-3; % en m
e2=9.5e-3     ;  % � compl�ter
R2=16.8e-3     ;  % � compl�ter
h0=R1+R2     ;  % � compl�ter


% Trac� de la loi entr�e - sortie pour un aller-retour de la lame
psi1=linspace(0.2*pi*R2/R1, 100);  % d�finition de l'intervalle d'�tude � compl�ter
z=h0+e2*sin(R1/R2*psi1);  % � compl�ter

% Trac� de la courbe avec titre, �tiquettes...
plot(psi1,z);  % � compl�ter
grid on
title('loi entr�e-sortie');  % � compl�ter
xlabel('\psi_1 [rad]');
ylabel('z');  % � compl�ter
  
%%%%%%%%%% Etude dynamique %%%%%%%%%%%

% G�om�trie des masses  
B1=67.7e-6; % en kg.m2
B2=10.4e-6;  % en kg.m2 � compl�ter
m3=50.1e-3;  % en kg � compl�ter

% Actions m�caniques
g=9.81;  % en m/s2
F1=50;   %   % en N � compl�ter
F2=20;  % en N � compl�ter

%% R�solution de l'�quation de mouvement avec moteur universel et effort de coupe %%

% Moteur universel
Cd=200e-3;% en Nm � compl�ter
wv=(2900*pi)/3;  % en rad/s � compl�ter

% Sauvegarde des donn�es num�riques dans la structure data
data=struct('R1',R1,'e2',e2,'R2',R2,'h0',h0,'B1',B1,'B2',B2,'m3',m3,'g',g,'F1',F1,'F2',F2,'Cd',Cd,'wv',wv);

% D�finition de l'intervalle d'�tude
ti=0;  % � compl�ter
tf=10;  % � compl�ter
tspan=[ti tf];  % � compl�ter

% Conditions initiales
Q0=[0 ; 0];  % � compl�ter Q0=[psi1(0); dpsi1(0)]

% D�finition des tol�rances sur les erreurs relatives et absolues
options = odeset('RelTol',1e-5,'AbsTol',1e-7);  

% Int�gration du syst�me differentiel
[t,Q]=ode45(@(t,Q) eq_mvt_scie_sauteuse(t,Q,data),tspan,Q0,options);
psi1=Q(:,1);  % � compl�ter
dpsi1=Q(:,2);  % � compl�ter

% Trac� de la vitesse de rotation de l'arbre d'entr�e
figure;
plot(t,dpsi1,'r');      
title('Vitesse de rotation en fonction de t');
xlabel('t [s]');
ylabel('d\psi_1 [rad/s]');
grid on  ;

% Trac� du couple moteur
Cm=Cd-Cd/wv*dpsi1; % � compl�ter
figure;
plot(t,Cm,'r');    
title('Couple Moteur en fonction de t');
xlabel('t [s]');
ylabel('Cm [Nm]');
grid on;  

% Trac� de la vitesse de la lame
dz=e2*R1/R2*dpsi1.*cos(R1/R2*psi1); % � compl�ter
figure;
plot(t,dz,'r');      
title('Vitesse de la lame en fonction de t');
xlabel('t [s]');
ylabel('dz [m/s]');
grid on;  

% Trac� de la puissance
P=Cm.*dpsi1; % � compl�ter
figure;
plot(t,P,'r');      
title('Puissance en fonction de t');
xlabel('t [s]');
ylabel('P');
grid on; 

%{
%% Asservissement en vitesse %%
w=  ;  % en rad/s � compl�ter

% Couple moteur impos� avec effort de coupe Fc en fonction du temps
t=linspace(0.2*pi*R2/R1*(1/w),1000)  ;  % � compl�ter pour un aller-retour de la lame
dz=  ;  % � compl�ter
Fc=   ;  % � compl�ter
Cm=  ;  % � compl�ter

% Trac� du couple moteur
figure;

% Trac� de la puissance

%}

