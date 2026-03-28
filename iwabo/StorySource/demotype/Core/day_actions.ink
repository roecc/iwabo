
=== chores_generator ===
//add turn on?
//+\[approach generator\]
-(options)
    {generator !? fine:<-tr_fix_generator}
    +\ {ap_option("maintain generator", -1)}
	    ~ap_update(-1)
	    ~maintain_update(generator, 1)
	    //nice place to experiment with loop tools of ink
        you fuck around with the machine keeping you alive ignoring its irritated rumbling any time you touch it.
        ->interaction_done
    +\ {ap_option("upgrade generator", -1)}
        ~ap_update(-1)
        ->interaction_done
    +[inspect]
        the generator is {generator^repair_state} and {generator^maintain_state}.
        ->interaction_done
    //+[done]
    //    ->interaction_done

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
	->interaction_done
- (fail) //on fail
    nothing happens
	->interaction_done

=== chores_garden ===
//+\[approach garden\]
-(options)
    //should potentially not even be an action but happen over time if well maintained?
    //offer double maintain for trait roll?
    {farm !? fine:<-tr_fix_farm}
    +\ {ap_option("maintain farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        ~ap_update(-1)
        ~maintain_update(farm, 1)
        ->interaction_done
    + {farm^repair_state==fine && farm^power_state==on}\ {ap_option("harvest farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        //should really check if farm was on last cycle, too?
        ~ap_update(-1)
        ~food++
        ->interaction_done
    +\ {ap_option("extend farm", -1)}
        ~ap_update(-1)
        ->interaction_done
    +[inspect]
        the farm is {farm^repair_state} and {farm^maintain_state}.
        ->interaction_done
    //+[done]
    //    ->interaction_done

= tr_fix_farm
~temp text = "fix farm"//"option text"
~temp trait = tinkering//trait_name"
~temp ap_cost = -1

~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers
{add_mod("friendly fish", 30, mod_text, mod_val)}
- (option)
->trait_option(text, trait, mod_val, mod_text, not counter_roll, ap_cost,->pass, ->fail)
- (pass) //on success
    the fish seems to be eating again.
    ~repair_update(farm, 1)
	->interaction_done
- (fail) //on fail
    the fish shake their heads at you disapprovingly.
	->interaction_done


=== chores_livingroom ===
// +\ {ap_option("watch TV", -1)}
//     ~ap_update(-1)
//     ->interaction_done
<-approach(->ue_tv, "TV", false)
<-approach(->ue_gym, "weights", false)
->DONE

=== chores_kitchen ===
+\ {ap_option("clean kitchen", -1)}
    ~ap_update(-1)
    ->interaction_done
+\ {ap_option("cook", -1)}
    ~ap_update(-1)
    ->interaction_done

=== chores_bedroom ===
+\ {ap_option("read", -2)}
    ~ap_update(-2)
    ->interaction_done
+[sleep]
    {game?unreal:{npc_update(daryl, action, sleeping)}}
    ->end_day

=== chores_tv ===
+\ {ap_option("watch TV", -1)}
    ~ap_update(-1)
    ~morale_update(daryl, 1)
    ->interaction_done

=== chores_gym ===
+\ {ap_option("exercise", -1)}
    ~ap_update(-1)
    ~trait_update(strength, 1)
    ->interaction_done


=== interaction_done ===
{game^mode:
    -unreal:
        buffer # Linetime: {buffer_time}
        ->DONE
    -ink:->main_day//->->
}
//->DONE