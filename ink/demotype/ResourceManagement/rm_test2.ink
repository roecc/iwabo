VAR day = 0
//VAR ap_text = "\[-1 AP\] "
VAR dif_ap = 0

LIST repair_state = (broken = 1), (damaged = 2), (fine = 3)
LIST maintain_state = (forgotten), (neglected), (maintained), (well_maintained), (loved)
LIST power_state = (off = 0), (on = 1)
VAR generator = (name.Generator, fine, garden, maintained, on)
VAR farm = (name.Aquaponics, fine, garden, maintained, on)

//controls npc locations and actions during the day
VAR day_script = 0

=== function daily_damage(ref target) ===
~temp debug = 0
// this works!
// {target:
//     -?loved:
//         the target is loved.
//     -?well_maintained:
// }
~temp d6 = roll_d(6)
{d6>LIST_VALUE(target^maintain_state): {repair_update(target, -1)}}
{debug: \[rolled: {d6}\], \[list value {target^maintain_state}: {LIST_VALUE(target^maintain_state)}\]}

=== next_day(->day_scr) ===
~day++
DAY {day}:
~day_script = day_scr
{action_points<1:{daryl^name} wake up on the floor of the {daryl^location}.|You wake up feeling well rested}
~action_points = 5
~food--
//~generator_repair_update(-1)
~daily_damage(farm)
~daily_damage(generator)
~maintain_update(farm, -1)
~maintain_update(generator, -1)
\[food--\] \[food left: {food}\]
->main_day

//make day_script not a tunnel?
=== main_day ===
{dif_ap!=action_points:
    ->day_script->
    ~dif_ap=action_points
}
[action points: {action_points}]
{action_points<1:->next_day(day_script)}
//each loop, tunnel through day_script which defines character actions/updates with each stage?

->list_chores->
//+go do 
-
->main_day


= list_rooms
~temp index = 2
->list_all(index)->
+   ->-> //important part of the solution for double-stay

= list_all (index)
{
    -index<=LIST_COUNT(location):
        <-room_option(location(index))
        ~index++
        ->list_all(index)->
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

= list_chores
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
// {daryl?junes_room:
//     //{action_points<3:<-chores_evening}
// }
->story_opts->
+ ->chores_done
//+[done]
//    ->chores_done
->DONE

=== story_opts ===
//go to day_script and get opts based on day_act, player location etc.
->day_script->
->->


=== enter_room ===
//{daryl^name} enter {daryl^location}
{daryl^location:
    -living_room:
        You enter the large domed living room.
    -garden:
        //{mary_ann?garden: mary ann is standing there.}
        The enormous power house, your makeshift garden and vertical farm, covered in thick green and illuminated by countless grow-lamps.
    -parent_bedroom:
        Your well made bed is surrounded by overstuffed book shelves.
    -aprils_room:
        The floor of your daughters room is littered with paints, brushes, books, fabrics and little snippets of yarn.
    -junes_room:
        Toys half-heartedly thrown into the various boxes and half still posing mortal danger to any un-soled feet who dare enter.
    -pantry:
        Rows upon rows of conserves, dehydrated or freezedried, powdered or bottled, tightly stacked upon eachother from floor to ceiling.
}
->check_npc(daryl^location)->
->->

= check_npc (loc)
{mary_ann?loc:Mary Ann is {mary_ann^action}}
{april?loc:April is {april^action}}
{june?loc:June is {june^action}}
->->

=== chores_generator ===
//add inspect and turn on?
+\[approach generator\]
    {generator !? fine:<-tr_fix_generator}
    ++\ {ap_option("maintain generator", -1)}
	    ~ap_update(-1)
	    ~maintain_update(farm, 1)
	    //nice place to experiment with loop tools of ink
        you fuck around with the machine keeping you alive ignoring its irritated rumbling any time you touch it.
    ->chores_done
    ++\ {ap_option("upgrade generator", -1)}
        ~ap_update(-1)
        ->chores_done
    ++[inspect]
        the generator is {generator^repair_state} and {generator^maintain_state}.
        ->chores_done
    ++[done]
        ->main_day.list_chores

= tr_fix_generator
~temp text = "fix generator"//"option text"
~temp trait = tinkering//trait_name"
~temp ap_cost = -1

~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers
{add_mod("read the manual", 30, mod_text, mod_val)}
- (option)
->trait_option(text, trait, mod_val, mod_text, not counter_roll, ap_cost,->pass, ->fail)
- (pass) //on success
    the generator seems to calm a little
    ~repair_update(generator, 1)
	->chores_done
- (fail) //on fail
    nothing happens
	->chores_done

=== chores_garden ===
+\[approach garden\]
    ++\ {ap_option("maintain farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        ~ap_update(-1)
        ~maintain_update(farm, 1)
        ->chores_done
    ++ {farm^repair_state==fine && farm^power_state==on}\ {ap_option("harvest farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        //should really check if farm was on last cycle, too?
        ~ap_update(-1)
        ~food++
        ->chores_done
    ++\ {ap_option("extend farm", -1)}
        ~ap_update(-1)
        ->chores_done
    ++[inspect]
        the farm is {farm^repair_state} and {farm^maintain_state}.
        ->chores_done
    ++[done]
        //->main_day.list_chores
        ->chores_done

=== chores_livingroom ===
//+livingroom
+\ {ap_option("watch TV", -1)}
    ~ap_update(-1)
    ->chores_done
+\ {ap_option("exercise", -1)}
    ~ap_update(-1)
    ~trait_update(strength, 1)
    ->chores_done
//+[done]
//   ->main_day.list_chores

=== chores_kitchen ===
//+kitchen
    +\ {ap_option("clean kitchen", -1)}
	    ~ap_update(-1)
	    ->chores_done
	+\ {ap_option("cook", -1)}
	    ~ap_update(-1)
	    ->chores_done
	//+[done]
        //->main_day.list_chores
    //    ->chores_done

=== chores_bedroom ===
//+bedroom
    +\ {ap_option("read", -1)}
	    ~ap_update(-1)
	    ->chores_done
	+[sleep]
	    ->next_day(day_script)
	//+[done]
     //   ->main_day.list_chores

=== chores_evening ===
//+bedtime
    +\ {ap_option("read bedtime story", -1)}
	    ~ap_update(-1)
	    ->chores_done
	+sleep
	    ->next_day(day_script)
	//++[done]
    //    ->main_day.list_chores

=== chores_done ===
->->

//generalizing this throws: Line 250: Tried to divert to a target from a variable, but the variable (list_type) didn't contain a divert target, it contained 'broken, damaged, fine'.
=== function repair_update(ref target, value) === 
~temp debug = 1

{LIST_VALUE(target^repair_state)+value>=1:
    {LIST_VALUE(target^repair_state)+value<=LIST_VALUE(LIST_MAX(repair_state)):
        ~temp old_state = target^repair_state
        ~target -= old_state
        ~target += repair_state(LIST_VALUE(old_state)+value)
        {debug: [{target^name} repair state is now {target^repair_state}]}
    }
// -else:
//     OVERFLOWWWWW
}
{generator?broken:
    ~power_update(generator, power_state.off)
    ~power_update(farm, power_state.off)
-else:
    ~power_update(generator, power_state.on)
    ~power_update(farm, power_state.on)
}

=== function maintain_update(ref target, value) ===
~temp debug = 1

{LIST_VALUE(target^maintain_state)+value>=1:
    {LIST_VALUE(target^maintain_state)+value<=LIST_VALUE(LIST_MAX(maintain_state)):
        ~temp old_state = target^maintain_state
        ~target -= old_state
        ~target += maintain_state(LIST_VALUE(old_state)+value)
        {debug: [{target^name} maintain state is now {target^maintain_state}]}
        -else:
            ~trait_update(tinkering, 1)
    }
// -else:
//     OVERFLOWWWWW
}

=== function power_update(ref target, value) ===
~temp debug = 1

{target!?value:
    ~target -= target^power_state
    ~target += value
    {debug: [{target^name} power state is now {target^power_state}]}   
}

//could be generalized
// === function generator_repair_update(value) ===
// ~temp debug = 1

// ~temp old_state = generator^repair_state
// ~generator -= old_state
// ~generator += repair_state(LIST_VALUE(old_state)+value)
// {debug: [generator is now {generator^repair_state}]}
