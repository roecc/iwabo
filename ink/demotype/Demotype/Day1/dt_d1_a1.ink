=== dt_d1_a1 ===
//->dt_d1_linear
= wake_up
::a man, in a rustic but cozy concrete room, sleeping.
*[start]
::the man starts up, gathers himself and gets up.
you promised your daughter you would show her the garden today.

*{roll_trait(strength,100)}about time she starts pulling her own weight
    ~modify_trait(strength, 1)
*{roll_trait(nurturing, 100)}hopefully this will make her feel more in control of her life
    ~modify_trait(nurturing, 1)
*fetch her
    ->aquaponics_intro
-
*fetch her
    ->aquaponics_intro

= aquaponics_intro
::you and june walk down the corridor and into the large dome hall of the power-house, the beating heart of the bunker.
->ERROR.loose_end

=== dt_d1_linear
June jumps up excitedly as she sees you
Dad! are you finally going to let me help you in the garden?

*sigh
*be excited for her?
-
she runs ahead to the garden
*[follow her]You follow her.
-
when you arrive she's already looking at the fish
-(in_garden)
*\[talk to june\]
    remember June, this is a big responsibility.
    I need you to take this seriously.
    The generator may be what keeps the lights on, but the garden is where we get all of our fresh food.
    J: But we have so many conserves?
    D: sure, but you can eat those only for so long before losing it.
    ->in_garden
*\[interact with aquaponics\]
    ->aquaponics

= aquaponics
They aren't pets, June. We feed them and in return, they feed our plants.

This is a delicately balanced system. The fish fertilize the plants (they feed them), and in return the plants clean their water.
This way we don't need soil and lose very little water.



*Now look here:
    **can you see a difference with these plants?
    they look a little sad.
    **these plants look a little sad, don't they?
    **...
    --
-what's wrong with them?
D: they aren't getting enough food. /are lacking some nutrients.
J: can we help them?
D: grab that bottle over there.
*give it here
    **\[measure the right amount\]
    --
*now squeeze the bottle until that little compartment is about half full
    **eh
    --
-
->END



->DONE