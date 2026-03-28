=== walled_garden_inspect_3 ===
= dead_fish
*hide from june (brutality check)
    ->hide_dead_fish
*June meets death
    ->confront_mortality
->DONE

= hide_dead_fish
->DONE

= whole_lives_in_barrel
J:They spent their whole lives in barrel.
*they need the water
    ->without_water
<-are_they_happy
->DONE

= look_for_particles
->DONE

= look_how_pretty
->DONE

= gold_dust_disease
->DONE

= fish_sick
->DONE

= cull_the_sick
->DONE

= cull_without_june
->DONE

= without_water
*the outside is dangerous for them
    they cant breathe there
->whole_lives_in_barrel
->DONE

= are_they_happy
J:Do you think they're happy?
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
    --
*it's all they know
-
->DONE

= petting_fish
->DONE

= confront_mortality
J:what happened to it?
*it died
    ->whole_lives_in_barrel
->DONE

= outside_dangerous
->DONE

= have_family
->DONE

= fish_out_of_water
->DONE

= not_pets
->DONE
