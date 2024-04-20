% Hechos directos
rufian(bertoldo).
rufian(bartolo).
noble(romeo).
noble(bertoldo).
plebeyo(bartolo).
dama(gertrudis).
dama(julieta).
hermosa(julieta).

% Reglas indirectas
desea(X, Y) :- noble(X), hermosa(Y).
desea(X, Y) :- plebeyo(X), dama(Y).

rapta(X, Y) :- rufian(X), desea(X, Y).

% Predicados para responder preguntas
responder_pregunta(1, "¿Qué noble es un rufián?") :-
    noble(Nombre), rufian(Nombre),
    write(Nombre), write(' ').
responder_pregunta(2, "¿Quién es susceptible de ser raptada por Romeo?") :-
    rapta(romeo, Nombre),
    write(Nombre), write(' ').
responder_pregunta(3, "¿Quién puede raptar a Julieta?") :-
    rapta(Nombre, julieta),
    write(Nombre), write(' ').
responder_pregunta(4, "¿Quién rapta a quién?") :-
    rapta(Rufian, Victima),
    write(Rufian), write(' rapta a '), write(Victima), write('. ').
responder_pregunta(5, "¿A quién desea Bartolo?") :-
    desea(bartolo, Dama),
    write(Dama), write('. ').
responder_pregunta(6, "¿Y Romeo?") :-
    desea(romeo, Dama),
    write(Dama), write('. ').
responder_pregunta(7, "¿Cuál hermosa dama es deseada por Bartolo?") :-
    desea(bartolo, Dama), hermosa(Dama),
    write(Dama), write('. ').

% Loop para hacer preguntas y obtener respuestas

hacer_preguntas :-
    repeat,
    write('Hazme una pregunta (1-7) o escribe "salir" para terminar: '),
    read(Numero),
    ( Numero == salir -> true ; 
        responder_pregunta(Numero, Respuesta),
        writeln(Respuesta),
        hacer_preguntas
    ).

