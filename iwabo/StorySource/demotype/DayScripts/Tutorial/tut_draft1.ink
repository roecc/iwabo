=== tut_draft1 ===

->DONE


=== ds_tut_d1_intro ===
= wake_up
You wake up to June perched on your chest, breathing down your face with an excited grin.
J:Good morning dad!
*Good morning June-Bug
*Hello Sunshine //could be paranoia check?
*Can't breathe! //strength check?
-
J:You promised you would let me help you with the garden today!
-(ret)
*Did I?
    J:Mhm!
    ->ret
*Sure..
    **After breakfast
        J:But-
        <-stern_look
        ***C'mon, you gotta be hungry!
        ---
    **Let's go!
        J:Yay!
        ->june_runs_off
    --
*Another day?
    J:But-
    <-stern_look
    //{generator?broken}
    // **I wish I could but if I don't figure something out for the generator it could mean big trouble for us.
    //     ->june_disappointed
    ** -> //good place for conditionals if something urgent is going on
    --
-
FIN
->DONE

= stern_look
~temp text = "[give her a stern look]"//"option text"
~temp trait = authority//trait_name"
~temp ap_cost = 0

~temp mod_val = -100
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
->trait_option(text, trait, mod_val, mod_text, not counter_roll, ap_cost,->pass, ->fail)
- (pass) //on success
	->june_disappointed
    ->->
- (fail) //on fail
	J:I don't wanna wait! You promised! C'mon!
	->june_runs_off

= june_disappointed
J:*sigh* alright.
June slides off your chest and lands on the floor with a disatisfied thud, then drags herself toward the kitchen head hanging between her shoulders.
~npc_set(june, eating, living_room)
~buffer()
->end

= june_runs_off
~npc_set(june, waiting, garden)
// ~ue_june_div = ->explain_aquaponics
~ue_june_override = ->ds_tut_d1_gen//->wg1_scratch
~ue_general_override = ->ds_tut_d1_waiting

~buffer() //needs to be before text bc otherwise the buffer stays on choice
June pushes off your chest with a violent jerk and runs down the corridor.
//~buffer()
->end

= end
*June, hold on!
    the sound of little bare feet on concrete getting fainter with distance are the only response you get.
    ->end
*\[sigh\]
    ->end
+\[get up\]
    ~npc_update(daryl, action, action.none)
    ->->

=== ds_tut_d1_waiting ===
= june_complains
J:<>
{&dad! what are you doing? I'm waiting for you in the garden!|We don't have time for this right now, you wanted to finally start my training!}
{ds_tut_d1_waiting>3:{morale_update(june, -1)}}
->interaction_done

=== ds_tut_d1_gen ===
~temp t = true

Alright June,
*are you ready?
    **let's see what you've learned.
*let's see what you've learned.
-
+what is this room actually called?
    J:it's called the power house!
    **Very good!
        {morale_update(june, 1)}
        ***Why is it so important?
    **Why is it so important?
-
J:it's where we get all our power and food!
*what is the most important part?
	J:the generators have to always keep running.
-
*what would happen if they break?
    J:we would have no food, no light, no power.
-
*exactly
    --(fear)
    **our farms wouldn't last even a day without power
        ->ds_tut_d1_fear
    **we wouldn't be able to filter our air
        ->ds_tut_d1_fear
    **we would be stuck in pitch darkness
        ->ds_tut_d1_fear
    **we couldn't pump water from the ground
        ->ds_tut_d1_fear
    **...
-
*The generators are the beating heart of the bunker.
**Without them, we would have no farm, no water, no lights or even air.
***Only two of the original four are running for now.
****This gives us some critical redunandance at least.
    *****but I'm hoping to get the other two running eventually.
    *****[...]
-
J:What is reduna... redun..?
    -(redundance)
    *redundance
        ->ds_tut_d1_redundance
    +it means to have a spare if the other breaks.
        which is important since our aquaponics wouldn't last a day without power.
-
+lets take a look at generator2
    ~ue_generator2_override = ->ds_tut_d1_generator2
    ~ue_june_override = ->empt
    ->interaction_done
->DONE

=ds_tut_d1_fear
June {!nods stoically|flinches a litte|is visibly distraught|shakes her head as if to get the thought out of it}.
->fear

=ds_tut_d1_redundance
~temp _try = "{~re|de|we}{~run|gun|fun|lun|dun}{~dance|gans|dans|lance|chance}"
J:{_try}.
+{_try=="redundance"} HOLY FUCK YES!!!!
    ->redundance
+\ {~not quite,|June, no.|almost,|close,} re-dun-dance
    ->ds_tut_d1_redundance
+close enough.
    ->redundance
-
->DONE


=== ds_tut_d1_generator2 ===
*usually you can tell at a glance how the generators or aquaponics units are doing.
* ->
-
*the more you work with these machines, the more reliable your intuition gets.
* ->
-
*but the only way to make sure you don't miss anything is to inspect them.
* ->
-
*let's do that now.
* ->
-
//kiddiproof
<-gen2_options(generator2)
-

// +This is the powerhouse
//     June gives you an irritated look.
//     J:I know that already!
//     ++Oh yeah?
//         +++\[smile\]Why don't you tell me what you know?
//         +++        

->DONE

= gen2_options(_target)
//could make conditional on perception
{_target^name}, {_target^repair_state}, {_target^maintain_state}, {_target^power_state}

+[inspect]
    {_target^name} is {_target^power_state}, {_target^repair_state} and {_target^maintain_state}.
    ->ds_tut_d1_inspect(_target)
+ \[-1 AP\] fix generator \[ tinkering: 100%; read the manual: +30; \]
    ->ds_tut_d1_stop
+\ turn {_target^name} {_target?on:off|on}
    ->ds_tut_d1_stop
+\ {ap_option("maintain generator", -1)}
    ->ds_tut_d1_stop
+\ {ap_option("upgrade generator", -1)}
    ->ds_tut_d1_stop

= ds_tut_d1_inspect(_target)
*alright, the generator is {_target^power_state}, {_target^repair_state} and {_target^maintain_state}.
-
*Let's break down what that means.
    --(meaning)
    **\ {meaning>2:and finally, }this generator is {_target^power_state}
        ***generators are unique in that they add power to the bunker when they are on.
            ****which also means they subtract it when they break or we turn them off.
    **\ {meaning>2:and finally, }it's {_target^maintain_state}
        ***our generators and farms need constant maintenance.
        ****the better care we take of them, the less likely they are to be damaged or even break.
    **\ {meaning>2:and finally, }it's {_target^repair_state}
        damaged generators produce less power and are at risk of breaking.
        ***they need to be repaired which is difficult and not guaranteed to succeed.
*it looks like we didn't maintain the generator enough and it got damaged.
    **let's see if we can repair it and make sure it doesn't just break down again.
        ->interaction_done
-
{meaning<3:->meaning}
-(continue)
*the only way to 100% guarantee that systems don't break or wear over time is to turn them off.
    J:ok.
    ->interaction_done
->DONE
    
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
    ->ds_tut_d1_stop
    // the generator seems to calm a little
    // ~repair_update(_gen, 1)
    // {npc_set(daryl, working, garden)}
	->interaction_done
- (fail) //on fail
    ->ds_tut_d1_stop
//     nothing happens
//     {npc_set(daryl, working, garden)}
// 	->interaction_done

=== ds_tut_d1_stop ===
= june_complains
J:<>
{&dad! what are you doing?|you wanted to tell me how to inspect the generator!}
{ds_tut_d1_stop>3:{morale_update(june, -1)}}
->interaction_done

=== tut_d1_farm ===
->DONE



=== ds_tut_d1 ===
{action_points:
    -5:->a1->
    -4:->a2->
    -3:->a3->
    -2:->a4->
    -1:->a5->
}
->->

= a1
{ap_updated!=action_points:
    //~npc_update(daryl, action, action.none)
    //npc, action, location
    ~npc_set(june, action.none, parent_bedroom)
    ~ap_updated = action_points
    
    
    ~repair_update(generator2, -1)
    ~maintain_update(generator2, -2)
    
    ->ds_tut_d1_intro.wake_up
}
->->

= a2
{ap_updated!=action_points:
    ~ap_updated = action_points    
}
->->

= a3
{ap_updated!=action_points:
    ~ap_updated = action_points
}
->->

= a4
{ap_updated!=action_points:
    ~ap_updated = action_points
}
->->

= a5
{ap_updated!=action_points:
    ~ap_updated = action_points
}
->->
