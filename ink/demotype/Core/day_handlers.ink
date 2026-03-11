VAR day = 0
VAR dif_ap = 0
VAR day_script = 0

//pretty much the core game loop
//make day_script not a tunnel?
=== main_day ===
{dif_ap!=action_points:
    ->day_script->
    ~dif_ap=action_points
}
[action points: {action_points}]
{action_points<1:->next_day(day_script)}
//each loop, tunnel through day_script which defines character actions/updates with each stage?
->list_actions->
//- //may cause bug if removed, didnt see one yet
->main_day

= list_rooms
~temp index = 2
->list_all_room_options(index)->
+   ->-> //important part of the solution for double-stay

= list_all_room_options (index)
{
    -index<=LIST_COUNT(location):
        <-room_option(location(index))
        ~index++
        ->list_all_room_options(index)->
}
->->

= room_option (new_loc)
{location !? new_loc:main_day.room_option: {new_loc} is not a location->ERROR}
+{new_loc != daryl^location}[{new_loc}]
    <>{new_loc}
    ~location_update(daryl, new_loc)
    ->enter_room->
    ->->
//solution to double-stay bug
+{LIST_VALUE(new_loc)==LIST_VALUE(LIST_MAX(location))}[stay]
    ->->

= go_to
+go to 
    ->list_rooms->
->->

= list_actions
<-go_to
{daryl?garden:
    <-chores_generator
    <-chores_garden
}
{daryl?living_room:
    <-chores_livingroom
    <-chores_kitchen
}
{daryl?parent_bedroom:
    <-chores_bedroom
}
//get special day actions from day_script
->day_script->//->story_opts->
+ ->chores_done
->DONE


=== next_day(->day_scr) ===
~day++
+DAY {day}[]:
-
~day_script = day_scr
{action_points<1:{daryl^name} wake up on the floor of the {daryl^location}.|You wake up feeling well rested}
~action_points = 5
~food--
~daily_damage(farm)
~daily_damage(generator)
~maintain_update(farm, -1)
~maintain_update(generator, -1)
\[food--\] \[food left: {food}\]
->main_day


=== function daily_damage(ref target) ===
~temp debug = 0

~temp d6 = roll_d(6)
{d6>LIST_VALUE(target^maintain_state): {repair_update(target, -1)}}
{debug: \[rolled: {d6}\], \[list value {target^maintain_state}: {LIST_VALUE(target^maintain_state)}\]}