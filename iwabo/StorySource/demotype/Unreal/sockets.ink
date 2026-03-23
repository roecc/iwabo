//unreal plugs into these sockets which direct to knots set by ink

//npc
VAR ue_maryann_div = ->ERROR.ue_socket_empty
VAR ue_april_div = ->ERROR
VAR ue_june_div = ->ERROR

//interactibles
VAR ue_generator_div = ->ERROR

=== ue_mary_ann ===
//could consider making the div a tunnel. if it should exclude defaults, make the tunnel go ->DONE ?
->ue_maryann_div
->DONE
//could also have a default list of <-{location:}/{action:} gated options //if shes cleaning you have the option to offer to help (maybe if youre not used to it only when you have few actions left to make player feel like they dont have the "energy" to do it or that they have something better to do?)

=== ue_april ===
strum strum strum.
oh, hey dad.
+hey.
->DONE

=== ue_june ===
draw draw draw.
snif.
+keep it up.
->DONE

=== ue_generator ===
~location_update(daryl, garden)
->ue_sys.s_generator
<-ue_interact_done

=== ue_farm ===
~location_update(daryl, garden)
->ue_sys.s_farm
<-ue_interact_done

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

=== ue_sys ===

= s_farm
<-chores_garden.options
->DONE

= s_generator
<-chores_generator.options
->DONE

=== ue_interact_done ===
->day_script->
+[\[done\]]
    ->DONE

=== ue_bed ===
~location_update(daryl, parent_bedroom)
your bed taunts you with its plushed coushions and inviting promise of warmth.
<-chores_bedroom
<-ue_interact_done
->DONE



=== ue_tv ===
~location_update(daryl, living_room)
<-ue_interact_done
+\ {ap_option("watch TV", -1)}
    ~ap_update(-1)
    ->chores_done
    
=== ue_kitchen ===
~location_update(daryl, living_room)
<-chores_kitchen
<-ue_interact_done
->DONE

=== ue_kitchen_table
~location_update(daryl, living_room)
//sit/getup
<-ue_interact_done
->DONE

=== ue_gym ===
~location_update(daryl, living_room)
+\ {ap_option("exercise", -1)}
    ~ap_update(-1)
    ~trait_update(strength, 1)
    ->chores_done
<-ue_interact_done
->DONE

=== ue_pantry ===
<-ue_interact_done
->DONE

=== ue_junes_bed ===
~location_update(daryl, junes_room)
some text
<-ue_interact_done
->DONE


=== ue_plant ===
look it's dians beautiful planta maranta!
+\ {ap_option("water the plant", -1)}
	~ap_update(-1)
	   the plant is thirsty.
+\ {ap_option("kiss the pot", -1)}
	~ap_update(-1)
	the pot is flattered.
-
->ue_interact_done
->DONE

// === ue_room ===

// = r_garden
// // {daryl?garden:
//     <-chores_generator
//     <-chores_garden
//     ->DONE
// // }

// = r_living_room
// // {daryl?living_room:
//     <-chores_livingroom
//     <-chores_kitchen
//     ->DONE
// // }

// = r_parent_bedroom
// // {daryl?parent_bedroom:
//     <-chores_bedroom
//     ->DONE
// // }
// //get special day actions from day_script
// ->day_script->