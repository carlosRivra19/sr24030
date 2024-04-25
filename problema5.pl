% Hechos
entrada(paella).
entrada(gazpacho).
entrada(consome).
carne(filete_de_cerdo).
carne(pollo_asado).
pescado(trucha).
pescado(bacalao).
postre(flan).
postre(nueces_con_miel).
postre(naranja).
calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete_de_cerdo, 300).
calorias(pollo_asado, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces_con_miel, 500).
calorias(naranja, 50).

% Reglas
plato_principal(X):- carne(X); pescado(X).
comida(X, Y, Z):- entrada(X), plato_principal(Y), postre(Z).
valor_calorico(X, Y, Z, V):- comida(X, Y, Z), calorias(X, V1), calorias(Y, V2), calorias(Z, V3), V is V1+V2+V3.
comida_equilibrada(X, Y, Z):- valor_calorico(X, Y, Z, V), V < 800.

mostrar_comidas_con_consome :-
    comida(consome, PlatoPrincipal, Postre),
    write('Entrada: consome, Plato Principal: '), write(PlatoPrincipal),
    write(', Postre: '), write(Postre), nl,
    false. % Evita que aparezca "false" al final

mostrar_comidas_equilibradas_con_naranja :-
    comida_equilibrada(Entrada, PlatoPrincipal, naranja),
    write('Comida equilibrada con naranja como postre: '), nl,
    write('Entrada: '), write(Entrada), nl,
    write('Plato Principal: '), write(PlatoPrincipal), nl,
    write('Postre: naranja'), nl, nl,
    false. % Evita que aparezca "false" al final


mostrar_comidas_con_valor_calorico_500 :-
    comida(Entrada, PlatoPrincipal, Postre),
    valor_calorico(Entrada, PlatoPrincipal, Postre, 500),
    write('Comida con un valor calórico de 500: '), nl,
    write('Entrada: '), write(Entrada), nl,
    write('Plato Principal: '), write(PlatoPrincipal), nl,
    write('Postre: '), write(Postre), nl, nl,
    false. % Evita que aparezca "false" al final

% Consultas
:- mostrar_comidas_con_consome.
:- mostrar_comidas_equilibradas_con_naranja.
:- mostrar_comidas_con_valor_calorico_500.

