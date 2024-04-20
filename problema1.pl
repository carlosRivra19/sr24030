% Hechos
persona(maria).
persona(alfredo).
persona(tomas).
persona(susana).
persona(juan).
lee_libro(alfredo).
lee_libro(maria).
asiste_a_clases(alfredo).
asiste_a_clases(maria).
realiza_ejercicios(alfredo).
realiza_ejercicios(maria).
sabe_todo(tomas).
tutor(maria,juan).
tutor(juan,susana).

% Reglas
aprueba_examen(X) :- preparado_para_examen(X).
preparado_para_examen(X) :- sabe_todo(X).
preparado_para_examen(X) :- asiste_a_clases(X), realiza_ejercicios(X), lee_libro(X).
preparado_para_examen(X) :- preparado_para_examen(Y), tutor(Y,X).

% Predicados para responder preguntas
responder(aprueba_examen(juan)) :- write('Sí, Juan aprueba el examen.'), nl.
responder(preparado_para_examen(susana)) :- write('Sí, Susana está preparada para el examen.'), nl.
responder(sabe_todo(Sabio)) :- write('El sabio del grupo es '), write(Sabio), write('.'), nl.
responder(findall(Persona, aprueba_examen(Persona), Personas)) :- write('Aprueban el examen: '), write(Personas), write('.'), nl.

% Loop para hacer preguntas y obtener respuestas
hacer_preguntas :-
    repeat,
    write('Hazme una pregunta o escribe "salir" para terminar: '),
    read(Pregunta),
    ( Pregunta == salir -> true ; responder(Pregunta), fail ).

