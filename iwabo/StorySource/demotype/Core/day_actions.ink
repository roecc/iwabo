
=== chores_generator ===
//add turn on?
+\[approach generator\]
-(options)
    {generator !? fine:<-tr_fix_generator}
    +\ {ap_option("maintain generator", -1)}
	    ~ap_update(-1)
	    ~maintain_update(generator, 1)
	    //nice place to experiment with loop tools of ink
        you fuck around with the machine keeping you alive ignoring its irritated rumbling any time you touch it.
        ->chores_done
    +\ {ap_option("upgrade generator", -1)}
        ~ap_update(-1)
        ->chores_done
    +[inspect]
        the generator is {generator^repair_state} and {generator^maintain_state}.
        ->chores_done
    +[done]
        ->chores_done

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
-(options)
    {farm !? fine:<-tr_fix_farm}
    +\ {ap_option("maintain farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        ~ap_update(-1)
        ~maintain_update(farm, 1)
        ->chores_done
    + {farm^repair_state==fine && farm^power_state==on}\ {ap_option("harvest farm", -1)}
        //could do passives with maintain chores for crit pos, crit fail?
        //should really check if farm was on last cycle, too?
        ~ap_update(-1)
        ~food++
        ->chores_done
    +\ {ap_option("extend farm", -1)}
        ~ap_update(-1)
        ->chores_done
    +[inspect]
        the farm is {farm^repair_state} and {farm^maintain_state}.
        ->chores_done
    +[done]
        ->chores_done

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
	->chores_done
- (fail) //on fail
    the fish shake their heads at you disapprovingly.
	->chores_done


=== chores_livingroom ===
+\ {ap_option("watch TV", -1)}
    ~ap_update(-1)
    ->chores_done
+\ {ap_option("exercise", -1)}
    ~ap_update(-1)
    ~trait_update(strength, 1)
    ->chores_done

=== chores_kitchen ===
+\ {ap_option("clean kitchen", -1)}
    ~ap_update(-1)
    ->chores_done
+\ {ap_option("cook", -1)}
    ~ap_update(-1)
    ->chores_done

=== chores_bedroom ===
+\ {ap_option("read", -2)}
    ~ap_update(-2)
    ->chores_done
+[sleep]
    {game?unreal:{npc_update(daryl, action, sleeping)}}
    ->end_day

=== chores_done ===
{game^mode:
    -unreal:->DONE
    -ink:->->
}
//->DONE