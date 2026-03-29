//write multiple generic descriptions of locations and tunnel through them here. otherwise write specific descriptions here.
=== ds_walled_garden ===
//each location checks here for unique actions, good?
{action_points:
    -5:->a1->
    -4:->a2->
    -3:->a3->
    -2:->a4->
    -1:->a5->
}
->->

//set unreal sockets here
= a1
{ap_updated!=action_points:
    //npc, action, location
    ~npc_set(mary_ann, cooking, living_room)
    // ~npc_set(april, watching_tv, living_room)
    ~npc_set(june, action.none, parent_bedroom)
    
    ~ap_updated = action_points
    
    //->should kick into interaction immediately
    ->walled_garden_intro.wake_up
}
->->

= a2
{ap_updated!=action_points:
    // ~npc_set(mary_ann, cooking, living_room)
    // ~npc_set(april, reading, living_room)
    // ~npc_set(june, eating, living_room)

    ~ap_updated = action_points    
}
->->

= a3
{ap_updated!=action_points:
    // ~npc_set(mary_ann, eating, living_room)
    // ~npc_set(april, eating, living_room)
    // ~npc_set(june, eating, living_room)
    
    ~ap_updated = action_points
// -else:
//     {daryl?living_room:
//         +\ {ap_option("join family lunch", -1)}
//             M: bon apetit!
//             nom nom nom
//             ~ap_update(-1)
//             ->->
//     }   
}
->->

= a4
{ap_updated!=action_points:
    // ~npc_set(mary_ann, cleaning, living_room)
    // ~npc_set(april, playing_guitar, aprils_room)
    // ~npc_set(june, watching_tv, living_room)
    
    ~ap_updated = action_points
//-else:
    
}
->->

= a5
{ap_updated!=action_points:
    // ~npc_set(mary_ann, sleeping, parent_bedroom)
    // ~npc_set(april, sleeping, aprils_room)
    // ~npc_set(june, sleeping, junes_room)
    
    ~ap_updated = action_points
//-else:
    //<-ds_test_bedtime_story
}
->->


=== walled_garden_intro ===
= wake_up
You wake up to June perched on your chest, breathing down your face with an excited grin.
J:Good morning dad!
A:I'm not here! Spooky!!!
M:And I am watching tv! 
M:French laughter
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
    **{generator?broken}I wish I could but if I don't figure something out for the generator it could mean big trouble for us.
        ->june_disappointed
    ** -> //good place for conditionals if something urgent is going on
    --
-
FIN
->DONE

= stern_look
~temp text = "[give her a stern look]"//"option text"
~temp trait = authority//trait_name"
~temp ap_cost = 0

~temp mod_val = 0
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
~ue_june_div = ->wg1_scratch
~buffer() //needs to be before text bc otherwise the buffer stays on choice
June pushes off your chest with a violent jerk and runs down the corridor.
~buffer()
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


= walk_to_garden
->DONE

= at_the_garden
You find June clinging to a small watering-can rocking back and forth in anticipation.
*Can we get started?
-
June nods with barely contained excitement.
*You can put the can down, we won't need it for now.
    June looks at you in bewildered confusion.
    J:It's to water the plants!
    **Fine. Keep it. //skill check, trying everything else adds modifiers?
    **They are in water already.
    **June, I need you to take this seriously. 
        ***This garden is what keeps us alive.
        ---
        ***Taking care of it is a great responsibility.
        ---
        ***\[try to take the watering can\]
    --
    -
->END

//use options as exposition
= explain_aquaponics
*Can we get started?
-
//june should be messing around, doing something to prompt this
*June, I need you to take this seriously. The garden is what keeps us alive.
-
*It's where we grow all our fresh food.
-
//could do a player check for Junes favourite here?
*Without it, no tomatoes, no salad, no strawberries.



Youre a bit young to mess with the generator, so today we will focus on the farm.


*What do you remember from class?
    It's a circle! The fish feed the plants, and the plants clean the water for the fish!
    **Pretty much!//could do a passive check here
    **Not quite
-


->DONE

= short_explanation
Basically, we feed the fish, the fish feed the plants and the plants clean the water.
That way we get to have fresh produce and fish meat for very little cost.
->DONE

//meddling should force this, tinkering should++ //passive tinkering roll
= long_explanation
Basically, we create a symbiotic micro-cosm of two parts:
Aquaculture and Aquaponics.
In other words we farm fish for their meat and use their waste to grow plants without soil, which in turn clean and recycle the water for the fish.
This allows us to grow fresh crops with minimal fresh water and power.
It is a thing of beautiful efficiency.
->DONE
= check_tanks
->DONE
= not_enough_fish
->DONE
= add_ammonia
->DONE
