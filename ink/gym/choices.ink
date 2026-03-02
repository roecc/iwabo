=== choices ===
*default "\*"
    By default, every choice in the game can only be chosen once.
* -> out_of_choices
-
*again
    ->choices
+[done]->done
    
= out_of_choices
Fallback choices are never displayed to the player, but are 'chosen' by the game if no other options exist.
A fallback choice is simply a "choice without choice text":
Example: "\*	\-\> out_of_options"
* \* say it again!
    ->out_of_choices
* 	->
    And, in a slight abuse of syntax, we can make a default choice with content in it, using an "choice then arrow":
    ++[done]->done

= done
    ->INDEX
    
= sticky
The 'once-only' behaviour is not always what we want, of course, so we have a second kind of choice: the "sticky" choice. A sticky choice is simply one that doesn't get used up, and is marked by a + bullet.
Fallback choices can be sticky too.
You can select these choices over and over.
+\+again
    ->sticky
+\+and again
    ->sticky
*\*not like this
    ->sticky
+done
    ->done