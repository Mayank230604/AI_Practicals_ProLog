% Sentence -> Noun Phrase + Verb Phrase
sentence(s(NP, VP)) --> noun_phrase(NP), verb_phrase(VP).

% Noun Phrase -> Determiner + Noun
noun_phrase(np(Det, N)) --> determiner(Det), noun(N).
noun_phrase(np(N)) --> noun(N).  % Allow a noun phrase without a determiner

% Verb Phrase -> Verb + Noun Phrase
verb_phrase(vp(V, NP)) --> verb(V), noun_phrase(NP).

% Determiners
determiner(det(the)) --> [the].
determiner(det(a))   --> [a].

% Nouns
noun(n(cat))  --> [cat].
noun(n(dog))  --> [dog].
noun(n(fish)) --> [fish].

% Verbs
verb(v(eats))   --> [eats].
verb(v(chases)) --> [chases].


% phrase(sentence(S), [the, cat, eats, fish]).
% phrase(sentence(S), [the, fish, eats, dog]).
% phrase(sentence(S), [a, dog, chases, cat]).