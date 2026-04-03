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

// +This is the powerhouse
//     June gives you an irritated look.
//     J:I know that already!
//     ++Oh yeah?
//         +++\[smile\]Why don't you tell me what you know?
//         +++        

->DONE

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
    ~npc_update(daryl, action, action.none)
    //npc, action, location
    // ~npc_set(mary_ann, sleeping, junes_room)
    ~ap_updated = action_points
    
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
