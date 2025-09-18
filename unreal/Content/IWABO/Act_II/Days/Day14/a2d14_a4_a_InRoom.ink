INCLUDE ../globals.ink

->a2d14_a4_a_InRoom

=== a2d14_a4_a_InRoom ===
*[\[Knock\]]
    A: Go away!
*{not rf("listenedAprilCry")}[\[Listen\] #sc_perception]
    ->Listening
*{perception > 60} [\[Enter her room\]]
    A: What are you doing in here?
    A: Get out!
*[\[Leave\]]
    ->END
-
->END

= Listening
{outcome:
    #sf_listenedAprilCry
    You hear a faint sobbing from inside.
-else:
    #sf_listenedAprilCry
    You can't hear anything.
}
->a2d14_a4_a_InRoom