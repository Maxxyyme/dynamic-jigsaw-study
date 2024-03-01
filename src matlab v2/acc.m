function ddpsi1 = acc(t,Q,Fc, data) %%Permet de calculer ddpsi1

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

ddpsi1 = zeros(length(t),1);

for n = 1:length(t)
    Qn   = Q(n,:);
    psi1 = Qn(1);
    dpsi1 = Qn(2);
    Fcn = Fc(n);
    M    = C2*(r^2/R^2)+C1+a^2*(r^2/R^2)*m3*sin(-r/R*psi1)*sin(-r/R*psi1);
    ff   = r/R*a^2*sin(-r/R*psi1)*m3*r^2/R^2*dpsi1*dpsi1*cos(-r/R*psi1)+a*r/R*sin(-r/R*psi1)*Fcn-r/R*a*sin(-r/R*psi1)*m3*g;  % à compléter
    ddqn = M\ff;
    ddpsi1(n,:) = ddqn.'; %%On le transpose pour mettre notre vecteur colonne en ligne
end
