//unreal plugs into these sockets which direct to knots set by ink

//npc
VAR ue_maryann_div = ->empt //->ERROR.ue_socket_empty
VAR ue_april_div = ->empt //->ERROR.ue_socket_empty
VAR ue_june_div = ->empt //->ERROR.ue_socket_empty

=== empt ===
->DONE //super useful to make ->div VARs optional!

//interactibles
VAR ue_generator_div = ->ERROR

=== function debug_log (msg) ===
//~temp _debug = debug
{debug: 
    {game^mode:
        -unreal:
            # ue_debug {msg} # Linetime: .01
        -ink:
            ::{msg}
    }
}

=== ue_done_option ===
//why is it tunneling through day_script?
//->day_script-> i think it was for aX interactions
+[\[done\]]
    ->interaction_done

=== ue_mary_ann ===
//could consider making the div a tunnel. if it should exclude defaults, make the tunnel go ->DONE ?
<-ue_maryann_div
<-ue_done_option
->DONE
//could also have a default list of <-{location:}/{action:} gated options //if shes cleaning you have the option to offer to help (maybe if youre not used to it only when you have few actions left to make player feel like they dont have the "energy" to do it or that they have something better to do?)

=== ue_april ===
strum strum strum.
oh, hey dad.
<-ue_april_div
<-ue_done_option
// +hey.
//     ->interaction_done
->DONE

=== ue_june ===
// draw draw draw.
// snif.
<-ue_june_div
<-ue_done_option
// +keep it up.
//     ->interaction_done
->DONE

=== ue_generator ===
~location_update(daryl, garden)
<-chores_generator.options
//->ue_sys.s_generator
<-ue_done_option
->DONE

=== ue_farm ===
~location_update(daryl, garden)
<-chores_garden.options
//->ue_sys.s_farm
<-ue_done_option
->DONE


=== ue_sys ===

= s_farm
<-chores_garden.options
->DONE

= s_generator
<-chores_generator.options
->DONE


=== ue_bed ===
~location_update(daryl, parent_bedroom)
your bed taunts you with its plushed coushions and inviting promise of warmth.
<-chores_bedroom
<-ue_done_option
->DONE

=== ue_tv ===
~location_update(daryl, living_room)
<-chores_tv
<-ue_done_option
->DONE

    
=== ue_kitchen ===
~location_update(daryl, living_room)
<-chores_kitchen
<-ue_done_option
->DONE

=== ue_kitchen_table
~location_update(daryl, living_room)
//sit/getup
<-ue_done_option
->DONE

=== ue_gym ===
~location_update(daryl, living_room)
<-chores_gym
<-ue_done_option
->DONE

=== ue_pantry ===
<-ue_done_option
->DONE

=== ue_junes_bed ===
~location_update(daryl, junes_room)
some text
<-ue_done_option
->DONE


=== ue_plant ===
look it's dians beautiful planta maranta!
<-ue_done_option
+\ {ap_option("water the plant", -1)}
    ~ap_update(-1)
    the plant is thirsty.
    ->interaction_done
+\ {ap_option("kiss the pot", -1)}
	~ap_update(-1)
	the pot is flattered.
	->interaction_done
->DONE
