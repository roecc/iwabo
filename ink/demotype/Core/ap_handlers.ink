VAR action_points = 0

=== function ap_option(text, ap_cost) ===
~temp opt_txt = ""
{
    -ap_cost != 0:
        ~opt_txt += "\[{ap_cost} AP\] "
}
~opt_txt += text
~temp tmp_txt = "{action_points>=-ap_cost: {opt_txt}}"
~return tmp_txt

=== function ap_update (amount) ===
~temp debug = 1

~action_points += amount
{debug && amount!=0:\[ap: {action_points}]}
{
    -action_points < 1:
        You collapse on the floor.
}