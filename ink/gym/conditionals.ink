=== conditionals ===
+simple conditionals
    ->simple
+multiple conditions
    ->multi
+and / or
    ->and_or
+conditional inline diverts
    ->conditional_inline_divert_test


= simple
You can also turn choices on and off by hand. ink has quite a lot of logic available, but the simplest tests is "has the player seen a particular piece of content".
Every knot/stitch in the game has a unique address (so it can be diverted to), and we use the same address to test if that piece of content has been seen.
->example

= multi
You can use several logical tests on an option; if you do, all the tests must all be passed for the option to appear.
->multi_example

= multi_example
set only two to true.
    +[set one to true]
        ->one_true
    +[set two to true]
        ->two_true
    +{not one_true}{two_true}[new option bc only two is true]
        Hurray.
        ->INDEX
    +[done]
        ->INDEX

= one_true
    ->multi_example
= two_true
    ->multi_example

= and_or
The above "multiple conditions" are really just conditions with an the usual programming AND operator. Ink supports and (also written as \&&) and or (also written as \|\|) in the usual way, as well as brackets.
\*	{ not (visit_paris or visit_rome) && (visit_london || visit_new_york) } [ Wait. Go where? I'm confused. ] \-> visit_someplace
I'm too lazy to write a full example of for now.
You can also use the standard ! for not, though it'll sometimes confuse the compiler which thinks \{!text\} is a once-only list. We recommend using not because negated boolean tests are never that exciting.
+[done]
    ->INDEX

=== example ===
* [Visit Stitch directly]
    Note that the test knot_name is true if any stitch inside that knot has been seen.
    ->visit_paris.met_estelle
*	{ not visit_paris } 	[Go to Knot] -> visit_paris
+ 	{ visit_paris 	 } 		[Return to Knot] -> visit_paris

+	{ visit_paris.met_estelle } [ Visited Stitch ] -> visit_paris.phone_estelle

=== visit_paris ===
    *Visit Stitch
        ->met_estelle
    *Get Bored of Knot
        ->visit_paris
    +return
        ->example
        
= met_estelle
    ->example

= bored
    ->example

= phone_estelle
Note also that conditionals don't override the once-only behaviour of options, so you'll still need sticky options for repeatable choices.
+[done]
    ->INDEX
    
=== multi_conditionals ===
You can use several logical tests on an option; if you do, all the tests must all be passed for the option to appear.
->INDEX


=== conditional_inline_divert_test ===
//this only displays the value of set_true
//+this option has a body { set_true } ->divert_to
  +this option has a body 
    { not set_true } ->divert_to
    this is the body.
    ++[done]
        ->INDEX
+change var
    ->set_true

= set_true
condition now met.
->conditional_inline_divert_test

= divert_to
you skipped the body of the option.
->conditional_inline_divert_test
