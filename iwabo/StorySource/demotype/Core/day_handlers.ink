VAR day = 0
VAR dif_ap = 0
VAR day_script = 0

=== function wipe_sockets() ===
~ue_maryann_div = ERROR.ue_socket_empty

//pretty much the core game loop
//make day_script not a tunnel?

=== main_day ===
//~wipe_sockets()
{dif_ap!=action_points:
    ->day_script->
    ~dif_ap=action_points
}
{debug_log("[action points: {action_points}]")}
{action_points<1:->end_day}

{game^mode:
    -unreal:->DONE
    -ink:
        //each loop, tunnel through day_script which defines character actions/updates with each stage?
        ->ink_nav.list_actions//->
        //- 
        //may cause bug if removed, didnt see one yet
        ->main_day
}


=== function random_day() ===
::random day
{~{set_day_scr(->ds_1)}|{set_day_scr(->ds_june_sick)}}

=== function set_day_scr(->scr) ===
~day_script = scr

=== end_day ===
//needed to be before random day for some fucking reason?!
~npc_update(daryl, action, action.sleeping)

~random_day()
->next_day(day_script)

=== next_day(->day_scr) ===
~day++
+{game^mode==ink}DAY {day}[]:
+{game^mode==unreal}[DAY {day}]
-
~day_script = day_scr
~ap_updated = -1
{game?unreal:::buffer # Linetime: {buffer_time}}
~npc_update(daryl, action, action.none)

~temp _txt = "{action_points<1:{daryl^name} wake up on the floor of the {daryl^location}.|You wake up feeling well rested}"
{game^mode:
    -unreal: {debug_log(_txt)}
    -ink: {_txt}
}
~action_points = set_ap_per_day
~food--
{debug_log("[food--] [food left: {food}]")}
~daily_damage(farm)
~daily_damage(generator)
~maintain_update(farm, -1)
~maintain_update(generator, -1)
{game?unreal:::buffer # Linetime: {buffer_time}}
->main_day


=== function daily_damage(ref target) ===
~temp _debug = 0

~temp d6 = roll_d(6)
{d6>LIST_VALUE(target^maintain_state): {repair_update(target, -1)}}
{_debug: {debug_log("[rolled: {d6}\], \[list value {target^maintain_state}: {LIST_VALUE(target^maintain_state)}]")}}