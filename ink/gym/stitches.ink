=== stitches ===
Knots can include sub-sections called "stitches".
->sub_knots

=== sub_knots ===

= first
    Diverting to a knot which contains stitches will divert to the first stitch in the knot.
    ->second
= second
    This doesn't cascade.
    *[next]
        ->third
= third
    stitches can be referenced directly by diverts.
    ->stitch_scope.second

=== stitch_scope ===
You can also include content at the top of a knot outside of any stitch. However, you need to remember to divert out of it - the engine won't automatically enter the first stitch once it's worked its way through the header content.
->END

= first
    is skipped by divert.
    ->END
= second
    stitches can have duplicate names provided they belong to a different knot.
    *local diverts
        ->local_diverts
= local_diverts
    From inside a knot, you don't need to use the full address for a stitch.
    ->INDEX