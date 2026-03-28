=== walled_garden_inspect_3 ===
= dead_fish
you spot a dead fish.
*{not june_finds_dead_fish}hide from june (brutality check)
    **pass
        ->hide_dead_fish
    **fail
        ***you should look at this, June
            ->confront_mortality
*June meets death
    ->confront_mortality
->DONE

//test passive dialogue?
= june_finds_dead_fish
J:Ahhh!
J:Dad come!
~ue_farm_override = ->dead_fish
~ue_june_override = ->dead_fish
->interaction_done
->DONE

= look_how_pretty
J:Look, how pretty!
June is pressing her face against the glass of the fish-tank. Her breath leaving excited condensation marks on the cool vitrine.
->gold_dust_disease
->DONE


= hide_dead_fish
some hijinks trying to hide the fish from June
{look_how_pretty:->sick_fish}
->look_how_pretty
->DONE

= whole_lives_in_barrel
J:They spent their whole lives in a barrel.
<-outside_dangerous
<-are_they_happy
->DONE

= gold_dust_disease
As you approach the tank you spot a strange glitter.
The fish are covered in a web of gold.
It's gold dust disease.
<-sick_fish
*{not dead_fish}notice the dead fish
    ->dead_fish
->DONE

= sick_fish
The fish are sick.
*You must act quickly.
    ->cull_the_sick

= cull_the_sick
you need to remove all of the infected fish if you want any hope of saving some of them asap.
//brutality check
* do without June (brutality check)
    **pass
        //you lose more fish.
        don't forget to do it!
        ->not_enough_fish
    **fail
        ->cull_the_sick
*\ {ap_option("we have to kill the sick ones before they infect the others", -1)}
	~ap_update(-1)
    {hide_dead_fish:->will_june_cull}
    J:I understand. //maybe they will get better?
    ->cull_with_june

->DONE

= cull_with_june
June is sobbing quietly, helping you fish out the infected, watching them gasp for air {outside_dangerous:in a cruel demonstration of what you told her earlier}.
//->whole_lives_in_barrel->
{have_family:{morale_update(june, -30)}}
->not_enough_fish
->DONE

//might be best as a tunnel, since it's quite important and currently only comes up if the dead fish isnt hidden.
= are_they_happy
J:Do you think they're happy?
-(opts)
//*why do you ask?
*they have all they need
    --(they_have)
    **their family
        ->have_family
    **safety
        ->they_have
    **all the food they can eat
        ->they_have
    **their friends
        ~morale_update(june, -10) //friends?
        ->they_have
    **why wouldn't they be happy?
        ->opts
*it's all they know
*who cares?
-
*{not gold_dust_disease}you notice something
    ->gold_dust_disease
*{gold_dust_disease}you need to come up with something
    ->sick_fish
->DONE

= have_family
~morale_update(june, 10) //in this together //should add a update message similar to journal
->they_have

= petting_fish
->DONE

= confront_mortality
J:what happened to it?
*it died
    ->whole_lives_in_barrel
->DONE

= outside_dangerous
*they need the water
    **the outside is dangerous for them. they cant breathe there.
->whole_lives_in_barrel
->DONE


= will_june_cull
J:no way! 
J:fish are friends, not food! //if seen nemo
*this isnt a discussion!
    ->cull_with_june
//     ->fish_out_of_water
*it's for the greater good
    ->the_greater_good
    
->DONE

// problem is, while a cute scene its too dramatic to ensure that we get the setup for wilting garden

// = fish_out_of_water
// J:ah!
// June pulls a fish out of the tank with all her might.
// J:run!
// The fish flops around helplessly on the floor.
// The fish is hurt and dies.
// *you see what happens? 
//     **that one wasnt even sick!

= the_greater_good
a long conversation about doing bad things for good reasons, the needs of the many vs the needs of the few ensues.
*June is convinced
    ->cull_with_june
*June doesn't see it that way
    ->will_june_cull

= not_pets
->DONE


= not_enough_fish
::not enough fish segment yay
*\ {walled_garden_inspect_3.cull_with_june:now that that's done} we should maintain the tank to try and stabilise it.
    ~ue_general_override = ->wg1_override2
    ~ue_june_override = ->empt
    ~ue_farm_override = ->wg1_farm_reroute2
    ->interaction_done
->DONE



=== wg1_not_enough_fish ===
*\ {walled_garden_inspect_3.cull_with_june:Since we lost so many fish, the problem we have now is that they|The problem we have now is that the fish} aren't making enough food for the plants.
-
*So we need to add some ourselves.
-
*Bring me that bottle over there.
    June hurries to get the bottle.
*\[get the bottle\]
    You go to pick up the bottle.
-
*\[hand the bottle to June\]
    ->june_helped
*\[squeeze the bottle\]
    J:You said you would let me help!
    --(m1)
    <-cant_afford_messup
    **\ {!You're right} //only on first option pattern ^^
        You're right
        ---(m2)
        <-cant_afford_messup
        ***Sorry
            ->m2
        ***Here you go \[give her the bottle\]
            ->june_helped
        ---
    **Sorry
        ->m1
    --
->DONE

= cant_afford_messup
*We can't afford to mess this up.
    June looks at you with her big round child eyes.
    **stay strong (authority) //helped with culling
        ***pass
            that won't work on me.
            ->diy
        ***fail
            ****\*sigh*, here \[give her the bottle\]
                ->june_helped
-
->DONE

= diy
*\[squeeze the bottle\]
-
*\[close the cap\]
-
*\[pour it in\]
*\[hand it to June\]
    Her eyes widen with joy.
    ->june_helped.pouring
-
*that's it!
*did you pay attention?
    J:I did. :/
    **you get to prove it to me next time.
    **good.
-
*that's it for today.
June slinks away unenthusiastically.
->done_for_today

= june_helped
J:yay!
~morale_update(june, 2)
*Squeeze the bottle until the little thingy is full.
    **A little more
        ***perfect! \[screw shut\]
-(pouring)
*now pour it into the water, here.
-
*good job!
    ~morale_update(june, 2)
*just like that.
-
*that's it for today.
    June gives you a hasty hug before running off.
    ->done_for_today
//*you should stick around and observe
->DONE

= done_for_today
~ue_general_override = ->empt
~ue_june_override = ->empt
~ue_farm_override = ->wg1_farm_reroute3
{trait_roll(foresight, 0)&&not walled_garden_inspect_3.cull_with_june&&not wg1_farm_reroute3.cull_alone:
Do not forget to take care of the sick fish!
}
->interaction_done

=== wg1_override2 ===
<-june_complains
->interaction_done

= june_complains
{!{wg1_override.june_complains:J:not this again!}}
J:<>
{~Dad! You said you would show me how to maintain the farm!|You don't seem to be focused on maintaining the farm?|Where are you going?}
{june_complains>3:{morale_update(june, -1)}}
->DONE

=== wg1_farm_reroute2 ===
<-options
<-ue_done_option
->DONE

= options
{farm !? fine:<-chores_garden.tr_fix_farm}
    +\ {ap_option("maintain farm", -1)}
        ->wg1_not_enough_fish
    + {farm^repair_state==fine && farm^power_state==on}\ {ap_option("harvest farm", -1)}
        <-wg1_override2.june_complains
        ->wg1_farm_reroute2
    +\ {ap_option("extend farm", -1)}
        <-wg1_override2.june_complains
        ->wg1_farm_reroute2
    +[inspect]
        <-wg1_override2.june_complains
        ->wg1_farm_reroute2

=== wg1_farm_reroute3 ===
<-options
<-ue_done_option
->DONE

= options
+\ {ap_option("maintain farm", -1)}
    //could do passives with maintain chores for crit pos, crit fail?
    ~ap_update(-1)
    ->cull_alone
    //~maintain_update(farm, 1)
    ->interaction_done
+[inspect]
    the farm is {farm^repair_state} and {farm^maintain_state}.
    the fish are still sick!
    I need to do something about that!
    ->wg1_farm_reroute3

= cull_alone
The vast tank empties as you find one fish after another covered in gold.
It is frightening to say the least.
~ue_farm_override = ->empt
->interaction_done
