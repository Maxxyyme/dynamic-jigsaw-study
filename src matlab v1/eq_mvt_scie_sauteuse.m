function dQn = eq_mvt_scie_sauteuse(t,Qn,data)

% R�cup�ration des valeurs num�riques de la structure param
R1=data.R1;
R2=data.R2;
e2=data.e2;
h0=data.h0;
B1=data.B1;
B2=data.B2;
m3=data.m3;
g=data.g;
F1=data.F1;
F2=data.F2;
Cd=data.Cd;
wv=data.wv;
% � compl�ter
    % � compl�ter pour r�cup�rer toutes les valeurs num�riques utiles

% Syst�me diff�rentiel de la forme U*dQn = F
psi1=Qn(1);  % � compl�ter
dpsi1=Qn(2);  % � compl�ter
dz=e2*R1/R2*dpsi1*cos(R1/R2*psi1);  % � compl�ter
Fc =-F1/2*(1+sign(dz))+F2/2*(1-sign(dz));  % Effort de coupe � compl�ter
Cm =Cd-Cd/wv*dpsi1;  % Couple moteur � compl�ter
M=B1*R2/R1+B2*R1/R2+m3*e2^2*R1/R2*cos(R1*psi1/R2)^2;  % � compl�ter
f=m3*e2^2*(R1/R2)^2*sin(R1/R2*psi1)*cos(R1/R2*psi1)*dpsi1^2+R2/R1*Cm+e2*cos(R1/R2*psi1)*(Fc-m3*g);  % � compl�ter
U =[1 0; 0 M];  %  � compl�ter
F =[dpsi1;f];  %  � compl�ter
dQn = U\F;
