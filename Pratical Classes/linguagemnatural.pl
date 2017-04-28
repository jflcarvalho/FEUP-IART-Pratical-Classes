% 8

% 8.1

%%%
% gramática
%

determinante(s-m) --> [o].
determinante(p-m) --> [os].
determinante(s-f) --> [a].

preposicao(_) --> [de].
preposicao(s-f) --> [da].

nome(p-m) --> [rapazes].
nome(s-m) --> [rapaz].
nome(s-m,rui) --> [rui].
nome(s-m) --> [rui].
nome(s-m) --> [luis].
nome(s-f) --> [rita].
nome(s-f) --> [ana].
nome(s-f) --> [maria].
nome(s-m) --> [elefante].
nome(p-m) --> [caes].
nome(p-m) --> [gatos].
nome(s-m) --> [cao].
nome(s-m) --> [gato].
nome(s-m) --> [futebol].
nome(p-m) --> [morangos].
nome(p-m) --> [amendoins].
nome(p-m) --> [bolachas].
nome(p-m) --> [humanos].
nome(p-f) --> [pessoas].

verbo(s) --> [joga].
verbo(p) --> [jogam].
verbo(s) --> [gosta].
verbo(p) --> [gostam].
verbo(s) --> [come].
verbo(p) --> [comem].
verbo(p) --> [sao].
verbo(s,gostar) --> [gosta].
verbo(s,jogar) --> [joga].

%%%
% base de dados
%

humano(rapaz).
humano(rui).
humano(maria).
humano(rita).
humano(ana).
humano(luis).
humano(humano).
humano([]).
humano([H|T]) :- humano(H), humano(T).

jogar(rapaz, futebol).
jogar(rui, futebol).
jogar(pokemon, futebol).

gostar(luis, morango).
gostar(rita, morango).
gostar(ana, morango).
gostar(rui, maria).
gostar(cao, bolacha).
gostar(gato, bolacha).

comer(elefante, amendoim).

ser(rui, rapaz).
ser(X, humano) :- humano(X).


% 8.2

%%%
% gramática
%

pron_inter(_-_) --> [quem].
pron_inter(p-_) --> [quais].
pron_inter(p-m) --> [quantos].
pron_inter(p-f) --> [quantas].

pronome(_) --> [que].


frase(A,S,O) --> sn(N,S),sv(N,A,O).
sn(N,S) --> determinante(N-G),nome(N-G,S).
sn(N,S) --> nome(N-_,S).
sv(N,gostar,O) --> verbo(N,gostar), preposicao(N1-G1), nome(N1-G1,O).
sv(N,A,O) --> verbo(N,A), sn(_,O).

concorda(A,S,O):-
  P =.. [A,S,O],
  (P,!,write(concordo);
  write(discordo)).

%Correr:
% ?- frase(gostar,rui,morangos,[o,rui,gosta,de,morangos],[]),concorda(gostar,rui,morangos).
