% Trac� de courbes

% Trac� de la fonction z = arctan(tan(x)) 

figure                          % Nouvelle figure, ou figure(n) ouvre la figure num�rot�e n
x = linspace(0,2*pi,1000);      % D�finition de l'intervalle d'�tude (x est un vecteur ligne de 1000 composantes variant de 0 � 2pi)
z = atan(tan(x));               % D�finition de la fonction
plot(x,z,'r','linewidth',1.5)   % Trac� de la fonction en rouge avec une �paisseur de trait de 1.5
title('z en fonction de x')     % Titre de la courbe
xlabel('x')                     % Titre de l'axe des abscisses
ylabel('z')                     % Titre de l'axe des ordonn�es
grid on                         % Affichage de la grille

% pour plus d'options

figure
p1=plot(x,z);
set(p1,'color',[1 0 0])         % Affectation de la couleur
set(p1,'linewidth',1.5,'linestyle','-.')    % Affection de l'�paisseur et du style
                                % cf. "doc plot" et "get(p1)" pour d'autres exemples et la liste des propri�t�s de la courbe trac�e
title('z en fonction de x')     % Titre de la courbe
xlabel('x')                     % Abscisses
ylabel('z')                     % Ordonn�es
grid on                         % Affichage de la grille
hold on                         % On conserve actif l'affichage en cours
p2=plot(x,2*z);
set(p2,'color',[0.1 0 1],'linewidth',1.5,'linestyle',':')  
legend('z','2z')                % Affichage de la l�gende

% Trac� de la fonction y = arctan(tan(x)) continue

x1=linspace(0,pi/2,250);               % D�finition de l'intervalle d'�tude [0,pi/2]
y1=atan(tan(x1));                      % D�finition de la fonction sur cet intervalle

x2=linspace(pi/2+0.001,3*pi/2,500);    % D�finition de l'intervalle d'�tude ]pi/2,3pi/2]
y2=atan(tan(x2))+pi;                   % D�finition de la fonction sur cet intervalle (modulo : pi)

x3=linspace(3*pi/2+0.001,2*pi,250);    % D�finition de l'intervalle d'�tude ]3pi/2,2pi]
y3=atan(tan(x3))+2*pi;                 % D�finition de la fonction sur cet intervalle (modulo : 2pi)

figure                                 % Trac� de la courbe dans une nouvelle fen�tre

plot(x1,y1,'b-.',x2,y2,'r:',x3,y3,'k','linewidth',1.5)         % Trac� des trois fonctions simultan�ment en bleu, rouge et noir avec les styles de lignes adapt�s
title('y en fonction de x')
xlabel('x')
ylabel('y')
grid on
legend('Trac� sur [0,\pi/2]','Trac� sur ]\pi/2,3\pi/2]','Trac� sur ]3\pi/2,2\pi]')

% Trac� de deux courbes c�te � c�te dans la m�me figure

figure

subplot(1,2,1)              % Division de la fen�tre active en une matrice de trac�s (1 ligne, 2 colonnes), activation de la 1e case pour le trac�
plot(x,z)
subplot(1,2,2)              % Activation de la 2e case pour le trac�
plot(x1,y1)