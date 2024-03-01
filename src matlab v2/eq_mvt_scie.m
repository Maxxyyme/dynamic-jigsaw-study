function dQn = eq_mvt_scie(t,Qn,data)

%Récupération des données utiles dans la fonction depuis la structure data

C1=data.C1;
r=data.r;
C2=data.C2;
a=data.a;
R=data.R;
m3=data.m3;
g=data.g;
F1=data.F1;
F2=data.F2;
Cd=data.Cd;
wv=data.wv;


psi1=Qn(1)  ;  % à compléter

dpsi1=Qn(2)  ;  % à compléter

dy=a*r/R*dpsi1*sin(-r/R*psi1);
Cm=Cd*(1-dpsi1/wv);  % à compléter
Fc=-F1/2*(1+sign(dy))+F2/2*(1-sign(dy));

M=C2*(r^2/R^2)+C1+a^2*(r^2/R^2)*m3*sin(-r/R*psi1)*sin(-r/R*psi1);  % à compléter

f0=r/R*a^2*sin(-r/R*psi1)*m3*r^2/R^2*dpsi1^2*cos(-r/R*psi1)+a*r/R*sin(-r/R*psi1)*Fc-r/R*a*sin(-r/R*psi1)*m3*g;  % à compléter

U =[1, 0;0, M];  %  à compléter

F =[dpsi1;Cm+f0];  %  à compléter

dQn = U\F;

