% Tracé de courbes

% Tracé de la fonction z = arctan(tan(x)) 

figure                          % Nouvelle figure, ou figure(n) ouvre la figure numérotée n
x = linspace(0,2*pi,1000);      % Définition de l'intervalle d'étude (x est un vecteur ligne de 1000 composantes variant de 0 à 2pi)
z = atan(tan(x));               % Définition de la fonction
plot(x,z,'r','linewidth',1.5)   % Tracé de la fonction en rouge avec une épaisseur de trait de 1.5
title('z en fonction de x')     % Titre de la courbe
xlabel('x')                     % Titre de l'axe des abscisses
ylabel('z')                     % Titre de l'axe des ordonnées
grid on                         % Affichage de la grille

% pour plus d'options

figure
p1=plot(x,z);
set(p1,'color',[1 0 0])         % Affectation de la couleur
set(p1,'linewidth',1.5,'linestyle','-.')    % Affection de l'épaisseur et du style
                                % cf. "doc plot" et "get(p1)" pour d'autres exemples et la liste des propriétés de la courbe tracée
title('z en fonction de x')     % Titre de la courbe
xlabel('x')                     % Abscisses
ylabel('z')                     % Ordonnées
grid on                         % Affichage de la grille
hold on                         % On conserve actif l'affichage en cours
p2=plot(x,2*z);
set(p2,'color',[0.1 0 1],'linewidth',1.5,'linestyle',':')  
legend('z','2z')                % Affichage de la légende

% Tracé de la fonction y = arctan(tan(x)) continue

x1=linspace(0,pi/2,250);               % Définition de l'intervalle d'étude [0,pi/2]
y1=atan(tan(x1));                      % Définition de la fonction sur cet intervalle

x2=linspace(pi/2+0.001,3*pi/2,500);    % Définition de l'intervalle d'étude ]pi/2,3pi/2]
y2=atan(tan(x2))+pi;                   % Définition de la fonction sur cet intervalle (modulo : pi)

x3=linspace(3*pi/2+0.001,2*pi,250);    % Définition de l'intervalle d'étude ]3pi/2,2pi]
y3=atan(tan(x3))+2*pi;                 % Définition de la fonction sur cet intervalle (modulo : 2pi)

figure                                 % Tracé de la courbe dans une nouvelle fenêtre

plot(x1,y1,'b-.',x2,y2,'r:',x3,y3,'k','linewidth',1.5)         % Tracé des trois fonctions simultanément en bleu, rouge et noir avec les styles de lignes adaptés
title('y en fonction de x')
xlabel('x')
ylabel('y')
grid on
legend('Tracé sur [0,\pi/2]','Tracé sur ]\pi/2,3\pi/2]','Tracé sur ]3\pi/2,2\pi]')

% Tracé de deux courbes côte à côte dans la même figure

figure

subplot(1,2,1)              % Division de la fenêtre active en une matrice de tracés (1 ligne, 2 colonnes), activation de la 1e case pour le tracé
plot(x,z)
subplot(1,2,2)              % Activation de la 2e case pour le tracé
plot(x1,y1)