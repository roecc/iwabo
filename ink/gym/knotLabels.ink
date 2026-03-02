=== knot_labels ===
This knot has been visited {knot_labels} times.
The again stitch {again} times however.
{But|for|some|reason|this|always|counts?}
+[self]
    ->knot_labels
+[again]
    //->knot_labels
    ->again
+[done]
    ->INDEX

= intro 
knot/stitch labels are actually read counts.
they are actually testing an integer and not a true/false flag. A knot or stitch used this way is actually an integer variable containing the number of times the content at the address has been seen by the player.
If it's non-zero, it'll return true.
They don't count up if they divert to self however, or even from stitches to self.

+test1
    ->again
+test2
    ->knot_count

= knot_count
knot_count_test has been visited {knot_count_test} times.
knot_count_test.trigger stitch {knot_count_test.trigger} times however.
+[visit knot]
    ->knot_count_test
+[visit trigger]
    ->knot_count_test.trigger
+[done]
    ->INDEX

= again
This knot has been visited {knot_labels} times.
The again stitch {again} times however.
->knot_labels

=== knot_count_test ===
    ->knot_labels.knot_count

= trigger
    ->knot_labels.knot_count