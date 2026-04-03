=== chores_generator(ref _target) ===
//could make conditional on perception
{_target^name}, {_target^repair_state}, {_target^maintain_state}, {_target^power_state}

<-chores_inspect(_target)
{_target !? fine:<-tr_fix_generator(_target)}
+\ turn {_target^name} {_target?on:off|on}
    ~power_switch(_target)
    //really should just divert back, but since the socket adds the done, it locks you in.
    ->interaction_done
+\ {ap_option("maintain generator", -1)}
    ~ap_update(-1)
    ~maintain_update(_target, 1)
    //nice place to experiment with loop tools of ink
    you fuck around with the machine keeping you alive ignoring its irritated rumbling any time you touch it.
    {npc_set(daryl, working, garden)}
    ->interaction_done
+\ {ap_option("upgrade generator", -1)}
    ~ap_update(-1)
    {npc_set(daryl, working, garden)}
    ->interaction_done


= tr_fix_generator(ref _gen)
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
    ~repair_update(_gen, 1)
    {npc_set(daryl, working, garden)}
	->interaction_done
- (fail) //on fail
    nothing happens
    {npc_set(daryl, working, garden)}
	->interaction_done

=== chores_garden(ref _target) ===
{_target^name}, {_target^repair_state}, {_target^maintain_state}, {_target^power_state}, {_target^life_time}
    //offer double maintain for trait roll?
    <-chores_inspect(_target)
    {_target?broken:<-tr_fix_farm(_target)}
    +\ turn {_target^name} {_target?on:off|on}
        ~power_switch(_target)
        ->interaction_done
    +\ {ap_option("maintain farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        ~ap_update(-1)
        {npc_set(daryl, working, garden)}
        
        ~maintain_update(_target, 1)
        ->interaction_done
    + {b_can_farm(_target)}\ {ap_option("harvest farm", -1)}
        ~ap_update(-1)
        {npc_set(daryl, working, garden)}
        ~ListSetMin(_target, life_time)
        ~food++
        ->interaction_done
    +\ {ap_option("extend farm", -1)}
        ~ap_update(-1)
        
        {npc_set(daryl, working, garden)}
        ->interaction_done


= tr_fix_farm(ref _farm)
~temp text = "start farm"//"option text"
~temp trait = tinkering//trait_name"

//no_fish?->divert!
~temp ap_cost = -1
+\ {ap_option("restart the farm", -1)}
	~ap_update(-1)
	~repair_update(_farm, 1)
    The few fish seem to take well to their new home, it will be a while before you can expect to reap what you've sewn.
    ->interaction_done

// ~temp mod_val = 0
// ~temp mod_text = ""
// - (mods) //add trait-check modifiers
// //{add_mod("friendly fish", 30, mod_text, mod_val)}
// - (option)
// ->trait_option(text, trait, mod_val, mod_text, not counter_roll, ap_cost,->pass, ->fail)
// - (pass) //on success
//     the fish seems to be eating again.
//     ~repair_update(_farm, 1)
//     {npc_set(daryl, working, garden)}
// 	->interaction_done
// - (fail) //on fail
//     the fish shake their heads at you disapprovingly.
//     {npc_set(daryl, working, garden)}
// 	->interaction_done


=== chores_breakerbox ===
Generators: {generator1^power_state},   {generator2^power_state}, {generator3^power_state}, {generator4^power_state}
<> Farm Units: {farm_unit1^power_state},   {farm_unit2^power_state}, {farm_unit3^power_state}, {farm_unit4^power_state}
+switch
    -(breaker_switch)
    ->switches()
    
->DONE

= switches()
<-switch(generator1)
<-switch(generator2)
<-switch(generator3)
<-switch(generator4)
<-switch(farm_unit1)
<-switch(farm_unit2)
<-switch(farm_unit3)
<-switch(farm_unit4)
<-done

->DONE

= switch(ref _target)
+\ turn {_target^name} {_target?on:off|on}
    ~power_switch(_target)
    ->chores_breakerbox.breaker_switch
    
= done
+[\[done\]]
    ->interaction_done


=== chores_livingroom ===
<-approach(->ue_tv, "TV", false)
<-approach(->ue_gym, "weights", false)
->DONE

=== chores_kitchen ===
+\ {ap_option("clean kitchen", -1)}
    ~ap_update(-1)
    {npc_set(daryl, cleaning, living_room)}
    ->interaction_done
+\ {ap_option("cook", -1)}
    ~ap_update(-1)
    {npc_set(daryl, cooking, living_room)}
    ->interaction_done

=== chores_bedroom ===
+\ {ap_option("read", -2)}
    ~ap_update(-2)
    {npc_set(daryl, reading, parent_bedroom)}
    ->interaction_done
+[sleep]
    //{game?unreal:{npc_update(daryl, action, sleeping)}}
    {npc_set(daryl, sleeping, parent_bedroom)}
    //fix for strange getup behaviour?
    ~action_points = 1
    ->end_day

=== chores_tv ===
+\ {ap_option("watch TV", -1)}
    ~ap_update(-1)
    ~morale_update(daryl, 1)
    {npc_set(daryl, watching_tv, living_room)}
    ->interaction_done

=== chores_gym ===
+\ {ap_option("exercise", -1)}
    ~ap_update(-1)
    ~trait_update(strength, 1)
    {npc_set(daryl, exercising, living_room)}
    ->interaction_done

=== chores_inspect(_target) ===
+[inspect]
    {_target^name} is {_target^power_state}, {_target^repair_state} and {_target^maintain_state}.
    ->interaction_done
->DONE


=== interaction_done ===
{game^mode:
    -unreal:
        buffer # Linetime: {buffer_time}
        ->DONE
    -ink:->main_day//->->
}
//->DONE