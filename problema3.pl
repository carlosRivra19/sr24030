% Hechos
experto(david, java).
experto(raul, prolog).
experto(luis, prolog).
experto(marta, java).
experto(fernanda, java).

disponibilidad(david, mañana).
disponibilidad(raul, mañana).
disponibilidad(luis, mañana).
disponibilidad(marta, tarde).
disponibilidad(fernanda, mañana).

% Regla
pueden_tener_reunion(X, Y) :-
    experto(X, Tema),
    experto(Y, Tema),
    disponibilidad(X, Tiempo),
    disponibilidad(Y, Tiempo),
    X \= Y.

