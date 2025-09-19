INCLUDE ../globals.ink

== a2d14_a4_mj_InShower
Mary-Ann sits in the shower, desperately hosing June down, 
trying to cool the red splotches on her thighs and arms,
{perception > 30: she is either ignoring or oblivious to the much bigger ones on her own.}
*{nurturing > 50} [These look pretty gnarly.]
    ->NurturedWounds


= NurturedWounds 
* [\[Dress the wound\] #ua_1]
    ->DressWound
* [I'm sure that will heal on it's own. #asc_nurturing]
    ->ShouldBeFine

        
= ShouldBeFine  
{outcome:
    D: Stop making such a fuss.
    ->DONE
-else:
    D: Although... these do look pretty nasty.
    ->NurturedWounds
}

= DressWound
D: Better make sure. #us_nurturing_1
You apply cold compresses against the burn wounds.
(-1 FirstAid)
->DONE