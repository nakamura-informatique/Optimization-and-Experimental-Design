%Trouver le minimum d'une fonction multivariable non linéaire contrainte
%Trouver les valeurs x1 et x2 pour lesquelles la fonction est optimale

[x,fval] = fmincon (@optimum,[0 0],[],[],[],[],[1 1],[],@constrain)

%Déclarer la fonction optimisée f(x)

function main = optimum(x)
    main  = 8*x(1)^2+10*x(2)^2+12*x(1)*x(2)+50*x(1)-80*x(2);
end 

%Créer des fonctions qui sont des variables liées
%Créer la première fonction de liaison

function h1 = constrain_1(x)
    h1 = x(1)+x(2)-1;
end

%Créer une deuxième fonction de liaison

function h2 = constrain_2(x)
    h2 = x(1)-0.5;
end

%Créer une troisième fonction de liaison

function h3 = constrain_3(x)
    h3 = -x(1);
end

%Créer la quatrième fonction de liaison

function h4 = constrain_4(x)
    h4 = -x(2);
end

%Afficher le minimum de cette fonction à l'aide de la commande fminsearch 

fminsearch (main,[1 1])

function [c,ceq] = constrain (x)
    c = [h1 h2 h3 h4];
    ceq = []; %Il n'y a pas de contrainte égale
end

%Reference: https://www.mathworks.com/help/optim/ug/fmincon.html#d124e94276
%https://www.mathworks.com/help/optim/ug/constrained-nonlinear-optimization-algorithms.html#brnox01
