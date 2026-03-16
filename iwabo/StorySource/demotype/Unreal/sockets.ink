//unreal plugs into these sockets which direct to knots set by ink

//npc
VAR ue_maryann_div = ->ERROR.ue_socket_empty
VAR ue_april_div = ->ERROR
VAR ue_june_div = ->ERROR

//interactibles
VAR ue_generator_div = ->ERROR

=== ue_mary_ann ===
->ue_maryann_div
->DONE
//could also have a default list of <-{location:}/{action:} gated options //if shes cleaning you have the option to offer to help (maybe if youre not used to it only when you have few actions left to make player feel like they dont have the "energy" to do it or that they have something better to do?)


=== function debug_log (msg) ===
~temp debug = 1

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


=== ue_room ===

= r_garden
// {daryl?garden:
    <-chores_generator
    <-chores_garden
    ->DONE
// }

= r_living_room
// {daryl?living_room:
    <-chores_livingroom
    <-chores_kitchen
    ->DONE
// }

= r_parent_bedroom
// {daryl?parent_bedroom:
    <-chores_bedroom
    ->DONE
// }
//get special day actions from day_script
// ->day_script->