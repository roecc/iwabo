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
~ue_june_div = ->dead_fish
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
*notice the dead fish
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
        ->walled_garden_not_enough_fish
    **fail
        ->cull_the_sick
*\ {ap_option("we have to kill the sick ones before they infect the others", -1)}
	~ap_update(-1)
    {hide_dead_fish:->fish_out_of_water}
    J:I understand. //maybe they will get better?

->DONE

= cull_with_june
June is sobbing quietly, helping you fish out the infected, watching them gasp for air {outside_dangerous:in a cruel demonstration of what you told her earlier}.
->walled_garden_not_enough_fish
->DONE

= are_they_happy
J:Do you think they're happy?
-(opts)
*they have all they need
    --(they_have)
    **their family
        ~morale_update(june, 10) //in this together //should add a update message similar to journal
        ->they_have
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
*you notice something
    ->gold_dust_disease
->DONE

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


= fish_out_of_water
->DONE

= not_pets
->DONE


=== walled_garden_not_enough_fish ===
not enough fish segment yay
->DONE

=== walled_garden_cull_without_june ===
->DONE