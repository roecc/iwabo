//==== top_knots ==== DONT WORK

=== other_knot ===
->stitch.sub_stitch

/*
=== other_other_knot ===
->stitch
==stitch
->sub_stitch
=sub_stitch
->DONE
*/

=== sub_stitch_test ===
knot
+[stitch] ->stitch
+[sub-stitch] ->stitch.sub_stitch
+[other stitch] ->other_stitch
+[sub-stitch] ->other_stitch.sub_stitch

+count
    ->count
+[done]
    ->INDEX

= intro
You can add a scope layer by using two ==. I will refer to those as stitches and single = as sub-stitches here but call == mid stitches from now to stay consistant with documentation calling = a stitch.
It seems only single = stitches can be targeted from other files however?
It would perhaps be advisable to avoid mid-stitches for now as they seem to have a lot of unexpected behaviours.
->sub_stitch_test

== stitch ==
stitch
+[down]
    ->sub_stitch
+[up]
    ->sub_stitch_test
    
= sub_stitch
sub-stitch
    +[up]
        ->stitch
    
    
== other_stitch ==
other stitch
+[down]
    ->sub_stitch
+[up]
    ->sub_stitch_test
+[switch stitch down]
    ->stitch.sub_stitch

= sub_stitch
other sub-stitch
    +[up]
        ->other_stitch

== count ==
know: {sub_stitch_test}
stitch: {stitch}
sub-stitch: {stitch.sub_stitch}

other stitch: {other_stitch}
other sub-stitch: {other_stitch.sub_stitch}
->sub_stitch_test