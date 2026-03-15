//unreal plugs into these sockets which direct to knots set by ink

//npc
VAR ue_maryann_div = ->ERROR.ue_socket_empty
VAR ue_april_div = ->ERROR
VAR ue_june_div = ->ERROR

//interactibles
VAR ue_generator_div = ->ERROR

=== ue_mary_ann ===
->ue_maryann_div

=== function ue_debug (msg) ===
# ue_debug {msg} # Linetime: .001
// ~debug_message = msg
// ->->