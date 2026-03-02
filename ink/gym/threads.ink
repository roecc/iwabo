=== threads ===
it's actually possible for a writer to 'fork' a story into different sub-sections, to cover more possible player actions.
engineering stories becomes somewhat more complex once threads are involved!
+simple example
    ->thread_example
+complex example
    ->thread_complex_example
+[done]
    ->INDEX


== thread_example ==
this knot really only contains two thread diverts \<-
their content is merged, then their options. once an option is picked, the superposition collapses and the story continues as if it had just diverted to this point, rather than forking to it.
<- fork_one
<- fork_two
->DONE


= fork_one
this is the first fork, the content of which will be followed by that of fork two.
*this is option one of fork one
*this is option two of fork one
-
this is the gather of fork one.
+[done]
    ->threads

= fork_two
this is fork two. what follows is the options of fork one. only then will my options be listed.
*this is option one of fork two
*this is option two of fork two
*this is option three of fork two
-
this is the gather of fork two.
+[done]
    ->threads

== thread_complex_example ==
let's test how this works with weaves.
<- fork_one
<- fork_two
+some other thing
    ->threads

= fork_one
f1
+f1 o1
    f1 o1 text
+f1 o2
    ++f1 o2.1
    ++f1 o2.2
    --
+f1 o3
    f1 o3 text
-
+[f1 done]
    ->threads

= fork_two
f2
+f2 o1
+f2 o2
-
f2 this text is cut off the fork. meaning forks only work until the first layer of choices. Which makes sense, really.
+[f2 done]
    ->threads