
%recoemendacion de playlist%
marina :-
    write('? '), read_word_list(Input), marina(Input), !.

marina([bye]) :-
    write('vuelva pronto'), nl.

marina(Input) :-
    pattern(Stimulus, Response),
    match(Stimulus, Dictionary, Input),
    match(Response, Dictionary, Output),
    reply(Output),
    !, marina.

match([N|Pattern], Dictionary, Target) :-
    integer(N), lookup(N, Dictionary, LeftTarget),
    append(LeftTarget, RightTarget, Target),
    match(Pattern, Dictionary, RightTarget).
match([Word | Pattern], Dictionary, [Word | Target]) :- atom(Word), match(Pattern, Dictionary, Target).
match([], _Dictionary, []).

%[hola] -> [hola,[buenas,tardes]]

pattern([X,2],['Hola humano soy Marina','¿','Como te llamas', '?']):-saludo(X).
pattern([X],['Es',un,placer,conocerte,X,, ,'¿','cual',es,tu,animo,hoy,'?']):-nombre(X).
pattern([X],['Podemos',crear,una,playlist,con,base,a,tus,gustos,y,mejorar,ese,animo,X,'¿','te',agrada,la,idea,'?']):-animo(X).
pattern([X],['Empecemos', ':)','¿','Que',es,lo,más,escuchas,'?']):-confirmacion(X).
pattern([X],['Es',cool,X,'¿','Banda',favorita,de,X,'?']):-musica(X).
pattern([X],[es,fantastico,X,'¿',que,actividad,te,gusta,hacer,mientras,escuchas,musica,'?']):-banda(X).
pattern([X],['A',mi,tambien,me,gusta,X,mientras,escucho,musiquita,'¿','Que',plataforma,usas,'?']):-actividad(X).
pattern([X],[X,es,agradable,'¿','De',donde,más,te,gusta,la,música,'?']):-plataforma(X).
pattern([X],['¡','CLARO','!',los,resultados,te,daran,una,playlist,con,nueva,musica,'¿','Listo','?']):-tipo(X).
pattern([X],['Compartela en tus redes sociales:']):-enterado(X).
pattern([X],['EL resultado es:',Y,Z]):-resultado(X,Y,Z).
pattern([1],[escriba,otra,pregunta]).

animo(enojado).
animo(ansioso).
animo(feliz).
animo(triste).
animo(cansado).
animo(deprimido).
animo(vengativo).
animo(preocupado).

resultado(gracias,'Rap','https://open.spotify.com/playlist/6Glieu8j2SVVXLGCmlcF4N?si=5aebdef9d4ab45ab').
resultado(okay,'Regueton','https://open.spotify.com/playlist/37i9dQZF1DWZjqjZMudx9T?si=23dff73913e34049').
resultado(enterado,'Clasica','https://open.spotify.com/playlist/7cDFT3t6MmjzjyqNSO38ki?si=e198b9bf94294048').
resultado(bueno,'Pop','https://open.spotify.com/playlist/37i9dQZF1DX6aTaZa0K6VA?si=ca4edb69d9ca460a').
resultado(sip,'Salsa','https://open.spotify.com/playlist/1DeVya9cgtEGZJ0eiREWJJ?si=101b1d9061c54122').
resultado(vale,'Rock','https://open.spotify.com/playlist/37i9dQZF1DWXRqgorJj26U?si=4ca4885d6259478f').
resultado(dale,'Punk','https://open.spotify.com/playlist/37i9dQZF1DX9wa6XirBPv8?si=f410609bb12140b4').
resultado(va,'Country','https://open.spotify.com/playlist/37i9dQZF1DX1lVhptIYRda?si=3dfbe8b375054b99').
resultado(jalo,'Metal','https://open.spotify.com/playlist/37i9dQZF1DWWOaP4H0w5b0?si=a4676b1e6b024c37').


actividad(leer).
actividad(tarea).
actividad(ejercicio).
actividad(limpiar).
actividad(trabajar).
actividad(conducir).
actividad(pasear).
actividad(meditar).
actividad(correr).
actividad(fiesta).


nombre(jacqueline).
nombre(arturo).
nombre(gisell).
nombre(eduardo).
nombre(paola).
nombre(monica).
nombre(valeria).
nombre(tamara).
nombre(elena).
nombre(julio).


musica(clasica).
musica(regueton).
musica(pop).
musica(salsa).
musica(rock).
musica(punk).
musica(country).
musica(metal).
musica(rap).

tipo(musicales).
tipo(peliculas).
tipo(series).

banda(nirvana).
banda(u2).
banda(queen).
banda(metallica).
banda(mozart).
banda(boccherini).
banda(beethoven).
banda(bach).
banda(badbunny).
banda(maluma).
banda(karolg).
banda(lunay).
banda(bts).
banda(justinbieber).
banda(jonas).
banda(giveon).
banda(cami).
banda(kaceymusgraves).
banda(taylor).
banda(slipknot).
banda(megadead).
banda(epica).
banda(sws).
banda(paramore).
banda(evanescence).
banda(pvris).
banda(adolescentes).
banda(celia).
banda(maeloruiz).
banda(traviscott).
banda(drake).
banda(logic).


plataforma(spotify).
plataforma(applemusic).
plataforma(dezzer).
plataforma(amazonmusic).


enterado(claro).




saludo(hola).
saludo(holis).
saludo(buenas).
saludo(buenos).

confirmacion(si).
confirmacion(no).




reply([Head | Tail]) :-
    write(Head), write(' '), reply(Tail).
reply([]) :- nl.

lookup(Key, [(Key, Value) | _Dict], Value).
lookup(Key, [(Key1, _Val1) | Dictionary], Value) :-
    Key \= Key1, lookup(Key, Dictionary, Value).

read_word_list(Ws) :-
    read_line_to_codes(user_input, Cs),
    atom_codes(A, Cs),
    tokenize_atom(A, Ws).


