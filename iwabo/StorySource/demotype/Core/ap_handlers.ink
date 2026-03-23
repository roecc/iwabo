VAR action_points = 1

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
~temp _debug = 0

~action_points += amount
//~ap_updated = true
{_debug && amount!=0: {debug_log("[action points left: {action_points}]")}}
{_debug && action_points<1: {debug_log("You collapse on the floor.")}}