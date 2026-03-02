=== functions ===
ink includes functions: they are knots, with the following limitations and features:
A function:
\* cannot contain stitches
\* cannot use diverts or offer choices
\* can call other functions
\* can include printed content (?)
\* can return a value of any type
\* can recurse safely

For more story-oriented call-stack-style features, see Tunnels.

let's call write_something().
~write_something()

functions return to where they were called once they're done.

~write_this("I am the passed parameter.")

~temp divert_target = ->other_target

functions can be passed diverts!
+ Change Divert
    ~change_divert(divert_target)
+ Keep Divert
-
+ Continue
    ->divert_target

- (continue)
+[done]
    ->INDEX

= other_target
You are at the unmodified divert target.
->continue

= changed_target
Which now takes us to the right stitch!
Note that divert addresses need to be explicitly typed by using '\->'.
->continue

=== function write_something() ===
"this function just writes this sentence and returns nothing."

=== function write_this(text) ===
this function writes what was passed to it by a parameter.
{text}

=== function change_divert(ref -> passed_target) ===
Though functions can't divert, they may be able to modify divert targets stored in a variable. Even if it is a temp.
For this to work however, we need to modify the actual temp, and not just a copy of it, which is the default behavious of parameters. 
We do this using the ref prefix.
change_divert(ref \->passed_target).
~passed_target = ->functions.changed_target