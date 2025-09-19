INCLUDE ../globals.ink

== a2d14_a4_a_InRoom
*[\[Knock\]]
    A: Go away!
*[\[Listen\] #sc_perception]
    ->Listening
*{perception > 60} [\[Enter her room\]]
    A: What are you doing in here?
    A: Get out!
+[\[Leave\]]
    ->DONE
-
->DONE

= Listening
{outcome:
    You hear a faint sobbing from inside.
-else:
    You can't hear anything.
}
->a2d14_a4_a_InRoom