=== wg1_scratch ===
the garden is what keeps us alive.
it's where we get all of our fresh produce and meat.
sure, we have lots of canned goods, but eating only those will drive you mad over time.
aquaponics are carefully balanced eco-systems that rely on the synnergy of the fish "feeding" the plants and the plants cleaning the water for the fish.
it needs to be carefully observed and managed.
if any part breaks, the whole system might crash.
so we need to maintain this balance at any cost.
J:it's like the bunker!
you got it!


even if nothing is broken, the system needs constant maintenance.


The whole bunker is powered by our generators.
If they {brutality:die, we die|stop running, we're in trouble}.
We use most of the power to run the farm.
It's where we get all of our fresh produce and meat.
Sure, we have lots of canned goods, but eating only those will do a number on morale.
And it will run out quicker.

Without the lights and waterpumps, we will lose the plants and fish.
Since we can't go outside, we have no way of getting more.
So at least one of them has to be kept alive and running at all times.

So you see, everything needs to do its part for the whole to work.

*Do you understand?
J:yea
-
*tell me
*good
-

Keeping all this running is a lot of work.
And we only have so much time in the day.
Which is why we need to think carefully about what we invest our energy in.
And why it's so important you learn to {brutality:pull your weight.|help out.}

The better we maintain them, the less likely they are to break down over time.

*Let's go Inspect out that aquaponics unit over there.
    ~ue_farm_override = ->wg1_farm_reroute
    ~ue_general_override = ->wg1_override
    ->interaction_done
-
->DONE

=== wg1_override ===
<-june_complains
->interaction_done

= june_complains
J:<>
{~Dad! You said you would show me how to inspect the farm!|Are you okay?|Where are you going?}
{june_complains>3:{morale_update(june, -1)}}
->DONE

=== wg1_farm_reroute ===
<-options
<-ue_done_option
->DONE

= options
{farm !? fine:<-chores_garden.tr_fix_farm}
    +\ {ap_option("maintain farm", -1)}
        <-wg1_override.june_complains
        ->wg1_farm_reroute
    + {farm^repair_state==fine && farm^power_state==on}\ {ap_option("harvest farm", -1)}
        <-wg1_override.june_complains
        ->wg1_farm_reroute
    +\ {ap_option("extend farm", -1)}
        <-wg1_override.june_complains
        ->wg1_farm_reroute
    +[inspect]
        the farm is {farm^repair_state} and {farm^maintain_state}.
        ->wg1_scratch2



=== wg1_scratch2 ===
{wg1_scratch2:
    -0:->one
    -1:->two
    -2:->three
}
-(one)
*as you can see, this unit is {farm^repair_state} and {farm^maintain_state}.
    **let's move on to the next one.
        ->interaction_done
* ->
-(two)
Aquaponics are complex systems, there is a lot that can go wrong.
*Do you remember how they work? //conditional on prev event? ->did we cover this in class?
    J:The fish feed the plants and the plants clean the water for the fish.
    **{trait_roll(tinkering, 0)||is_tox(tinkering)}not quite
        ---(not_quite)
        ->full_explanation
    **close enough
        {is_tox(tinkering): ->cr_close_enough(->close_enough, ->not_quite)}
        ---(close_enough)
    // J:It's sym.. sympti..
    // **symbiotic
    //     J:Yea! Symptiotic!
    // **\[...\]
    //     J:symptinotic?
    //     J:symptotic?
    //     J:symptiotic!!
    --
*\[explain the nitrite cycle\] //tinkering passive //meddling counter 
    ->full_explanation
*\[explain the basics\]
    ->simple_explanation
* ->
-(three)
// this means its a delicate balance where many things can go wrong and even small problems can create big ones.
// for today, let's check the tanks for any dirt or left over food.
->walled_garden_inspect_3.look_how_pretty
-
->DONE

= full_explanation
~temp _june_gone = false
We feed the fish.
Their waste is naturally rich in ammonia.
*some more stuff
    (While the player talks, June goes places.)
    ~_june_gone = true
-
*and more again
    (the player might notice)
    //should play custom LS here for June
-
J:look how pretty!
*and yet more
*{trait_roll(perception, 0)}notice June's gone
    **June, stay here
        June trotts back.
        ~_june_gone = false
    **follow June
        ->walled_garden_inspect_3.look_how_pretty
    --
-
*and more still
-
//where'd she go?
{_june_gone:->walled_garden_inspect_3.june_finds_dead_fish}
*let's go to the next tank.
    ->interaction_done
->DONE


= simple_explanation
    The fish feed the plants and the plants clean the water for the fish.
    This one seems fine.
    *Let's check the next one.
        ->interaction_done
->DONE

=== cr_close_enough(->_pass, ->_fail) ===
~temp text = "close enough"//"option text"
~temp trait = tinkering//trait_name"
~temp ap_cost = 0

~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers
{is_tox(foresight): {add_mod("she has to get this right", 30, mod_text, mod_val)}}
- (option)
->trait_option(text, trait, mod_val, mod_text, counter_roll, ap_cost, ->pass, ->fail)
- (pass) //on success
	->_pass
	//->wg1_scratch2.close_enough
- (fail) //on fail
	->_fail
	//->wg1_scratch2.not_quite





