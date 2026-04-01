VAR day = 0
VAR dif_ap = 0
VAR day_script = 0
VAR next_day_script = ->empt

=== function wipe_sockets() ===
~ue_maryann_div = ERROR.ue_socket_empty

//pretty much the core game loop
//make day_script not a tunnel?

=== main_day ===
//~wipe_sockets() //why is this here and not in next_day? //bc it runs on every ap update
//dif ap might be redundant?
{dif_ap!=action_points:
    ->day_script->
    ~dif_ap=action_points
}
{debug_log("[action points: {action_points}]")}
{action_points<1:->end_day}

{game^mode:
    -unreal:->DONE //kills the flow instead of switching, might be worth reworking
    -ink:
        //each loop, tunnel through day_script which defines character actions/updates with each stage?
        ->ink_nav.list_actions//->
        //- 
        //may cause bug if removed, didnt see one yet
        ->main_day
}


=== function random_day() ===
{~{set_day_scr(->ds_1)}|{set_day_scr(->ds_june_sick)}}

=== function set_day_scr(->scr) ===
~day_script = scr

=== end_day ===
//needed to be before random day for some fucking reason?! //could be buffer issue //put into next_day to read last action?

//~npc_update(daryl, action, action.sleeping)

{next_day_script!=->empt:
    ~day_script = next_day_script
    ~next_day_script = ->empt
-else:
    ~random_day()
}
~day_script = ->ds_1
->next_day(day_script)

=== next_day(->day_scr) ===
~day++
~temp _txt = wakeup_gag()
~npc_update(daryl, action, action.sleeping)
~buffer()

+{game^mode==ink}DAY {day}[]:
+{game^mode==unreal}[DAY {day}]
-
~day_script = day_scr
~ap_updated = -1
~dif_ap = -1
~buffer()
//moved to day_script
//~npc_update(daryl, action, action.none)

//~temp _txt = wakeup_gag()
{game^mode:
    -unreal: {debug_log(_txt)}
    -ink: {_txt}
}

~action_points = set_ap_per_day
~food--
{debug_log("[food--] [food left: {food}]")}

//farm growth
//~day_farm_grow()
~wear_and_tear()

//{game?unreal:::buffer # Linetime: {buffer_time}}
->main_day

=== function day_farm_grow () ===
~check_life(farm_unit1)
~check_life(farm_unit2)
~check_life(farm_unit3)
~check_life(farm_unit4)

=== function check_life(ref _target) ===
~temp _debug = debug_flags?d_life_time

{_target!?repair_state.broken && _target?power_state.on:
    ~ListStep(_target, life_time, 1)
}
{_debug:
    ~debug_log("{_target^name} life time: {_target^life_time}")
}

=== function wear_and_tear() ===
//~daily_damage(farm)
~daily_damage(farm_unit1)
~daily_damage(farm_unit2)
~daily_damage(farm_unit3)
~daily_damage(farm_unit4)
//~daily_damage(generator)
~daily_damage(generator1)
~daily_damage(generator2)
~daily_damage(generator3)
~daily_damage(generator4)
//~maintain_update(farm, -1)
~maintain_update(farm_unit1, -1)
~maintain_update(farm_unit2, -1)
~maintain_update(farm_unit3, -1)
~maintain_update(farm_unit4, -1)
//~maintain_update(generator, -1)
~maintain_update(generator1, -1)
~maintain_update(generator2, -1)
~maintain_update(generator3, -1)
~maintain_update(generator4, -1)
~power_check()
~day_farm_grow()
~buffer()

=== function wakeup_gag() ===
~temp _txt = "{daryl^name} wake up"
//_txt = "{action_points<1:{daryl^name} wake up on the floor of the {daryl^location}.|You wake up feeling well rested}"

{daryl^location:
    -parent_bedroom:
        ~_txt += " in your bed"
    -junes_room:
        ~_txt += " in your daughters bed"
}
{action_points>=1:
    ~_txt += " feeling well rested."
    ~_txt += "."
    ~return _txt
}
{daryl^action:
    -watching_tv:
        ~_txt += "{~ on the couch|on the floor| behind the couch| sprawled over the backrest of the couch} in front of the TV"
    -reading:
        ~_txt += " with a book on your face"
    -working:
         ~_txt += " on the floor, wrench in hand"
}
~_txt += "."
~return _txt

=== function daily_damage(ref target) ===
~temp _debug = debug_flags?d_daily_damage
// generator1 is {generator1^repair_state}
~temp d6 = roll_d(6)
~temp _failed = d6>LIST_VALUE(target^maintain_state)
{_failed: {repair_update(target, -1)}}
{_debug: {debug_log("[{_failed:failed! |passed! }rolled {d6} against \"{target^maintain_state}\": {LIST_VALUE(target^maintain_state)}]")}}
{target?sys_type.Farm && target?power_state.off:
        {target^name}
        //see if can use generalised functions
        ~repair_update(target, -1000)
        ~ListSetMin(target, life_time)
}
// generator1 is {generator1^repair_state}