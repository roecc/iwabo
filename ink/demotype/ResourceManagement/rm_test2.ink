VAR day = 0
VAR ap_text = "\[-1 AP\] "

LIST repair_state = (broken), (damaged), (fine)
//LIST maintain_state = neglected, maintained, well_maintained, loved
VAR generator = (fine)

=== next_day ===
{action_points<1:{daryl^name} wake up on the floor of the {daryl^location}.|You wake up feeling well rested}
~day++
~action_points = 5
DAY {day}:
~generator_repair_update(-1)
->main_day

=== main_day ===
[action points: {action_points}]
{action_points<1:->next_day}
//each loop, tunnel through day_script which defines character actions/updates with each stage?

+go to 
    ->list_rooms->
+do do 
    ->list_chores->
-
->main_day


= list_rooms
~temp index = 2
//->list->
->list_all(index)->//main_day
// <-room_option(location.garden)
// <-room_option(location.living_room)
// <-room_option(location.garden)

// +[garden]
//     <>garden
//     ~location_update(daryl, location.garden)
// +[parent's bedroom]
//     <>bedroom
//     ~location_update(daryl, location.parent_bedroom)
// +[livingroom]
//     <>livingroom
//     ~location_update(daryl, location.living_room)

// +[stay]
//     ->->

// -
 +   ->->
//->DONE

= list
//<-list_all(2)
+[stay]
    ->->

= list_all (index)
//~temp i = index
{
    -index<=LIST_COUNT(location):
        <-room_option(location(index))
        ~index++
        ->list_all(index)->
}
// {
//     -index==3:
//         +[stay]
//             ->->
// }
->->

= room_option (new_loc)
{location !? new_loc:main_day.room_option: {new_loc} is not a location->ERROR}
+{new_loc != daryl^location}[{new_loc}]
    <>{new_loc}
    ~location_update(daryl, new_loc)
    ->->
//solution to double-stay bug
+{LIST_VALUE(new_loc)==LIST_VALUE(LIST_MAX(location))}[stay]
    ->->
//works for some reason?
// +{new_loc == daryl^location}[stay]
//     ->->

= list_chores
<-chores_generator
<-chores_garden
<-chores_livingroom
<-chores_bedroom
{action_points<3:<-chores_evening}
+[done]
    ->chores_done
->DONE

=== chores_generator ===
+generator
    {generator !? fine:<-tr_fix_generator}
    ++\ {ap_option("maintain generator", -1)}
	~ap_update(-1)
	//nice place to experiment with loop tools of ink
    you fuck around with the machine keeping you alive ignoring its irritated rumbling any time you touch it.
    ->chores_done
    ++\ {ap_option("upgrade generator", -1)}
        ~ap_update(-1)
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
    ~generator_repair_update(1)
	->chores_done
- (fail) //on fail
    nothing happens
	->chores_done

=== chores_garden ===
+garden
    ++\ {ap_option("maintain farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        ~ap_update(-1)
    ->chores_done
    ++\ {ap_option("extend farm", -1)}
        ~ap_update(-1)
        ->chores_done
    ++[done]
        ->main_day.list_chores

=== chores_livingroom ===
+livingroom
    ++\ {ap_option("watch TV", -1)}
	    ~ap_update(-1)
	    ->chores_done
	++\ {ap_option("exercise", -1)}
	    ~ap_update(-1)
	    ~trait_update(strength, 1)
	    ->chores_done
	++[done]
        ->main_day.list_chores

=== chores_kitchen ===
+kitchen
    ++\ {ap_option("clean kitchen", -1)}
	    ~ap_update(-1)
	    ->chores_done
	++\ {ap_option("cook", -1)}
	    ~ap_update(-1)
	    ->chores_done
	++[done]
        ->main_day.list_chores

=== chores_bedroom ===
+bedroom
    ++\ {ap_option("read", -1)}
	    ~ap_update(-1)
	    ->chores_done
	++sleep
	    ->next_day
	++[done]
        ->main_day.list_chores

=== chores_evening ===
+bedtime
    ++\ {ap_option("read bedtime story", -1)}
	    ~ap_update(-1)
	    ->chores_done
	++sleep
	    ->next_day
	++[done]
        ->main_day.list_chores

=== chores_done ===
->->


//could be generalized
=== function generator_repair_update(value) ===
~temp debug = 1

~temp old_state = generator^repair_state
~generator -= old_state
~generator += repair_state(LIST_VALUE(old_state)+value)
{debug: [generator is now {generator^repair_state}]}
