% Hechos directos
padecimiento(manuel, gripe).
padecimiento(manuel, hepatitis).
padecimiento(jose, hepatitis).
padecimiento(guadalupe, gripe).
padecimiento(claudia, intoxicacion).

sintoma(gripe, fiebre).
sintoma(hepatitis, cansancio).
sintoma(intoxicacion, diarrea).

suprime(fiebre, aspirina).
suprime(diarrea, intestinomicina).

% Reglas inferidas
alivia_persona(Persona, Padecimiento, Farmaco) :-
    padecimiento(Persona, Padecimiento),
    sintoma(Padecimiento, Sintoma),
    suprime(Sintoma, Farmaco).

deberia_tomar(Persona, Farmaco) :-
    padecimiento(Persona, Padecimiento),
    alivia_persona(Persona, Padecimiento, Farmaco).

% Predicados para responder preguntas
responder_pregunta(1, "¿Qué dolencia tiene Manuel?") :-
    padecimiento(manuel, Dolencia),
    write(Dolencia).
responder_pregunta(1, "¿Qué dolencia tiene Guadalupe?") :-
    padecimiento(guadalupe, Dolencia),
    write(Dolencia).
responder_pregunta(2, "¿Quién padece gripe?") :-
    padecimiento(Persona, gripe),
    write(Persona), write(' ').
responder_pregunta(3, "¿Qué síntomas tiene Manuel?") :-
    padecimiento(manuel, Padecimiento),
    sintoma(Padecimiento, Sintoma),
    write(Sintoma), write(', ').
responder_pregunta(4, "¿Quién padece diarrea?") :-
    padecimiento(Persona, intoxicacion),
    write(Persona), write(' ').
responder_pregunta(5, "¿Y quién está cansado?") :-
    padecimiento(Persona, hepatitis),
    write(Persona), write(' ').
responder_pregunta(6, "¿Hay algún fármaco que alivie a Manuel?") :-
    alivia_persona(manuel, _, Farmaco),
    write(Farmaco).
responder_pregunta(7, "¿Hay algún síntoma que compartan Jose y Guadalupe?") :-
    padecimiento(jose, Padecimiento),
    padecimiento(guadalupe, Padecimiento),
    sintoma(Padecimiento, Sintoma),
    write(Sintoma).

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
