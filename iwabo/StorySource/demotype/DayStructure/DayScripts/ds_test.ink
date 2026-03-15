VAR ap_updated = -1

//write multiple generic descriptions of locations and tunnel through them here. otherwise write specific descriptions here.
=== ds_1 ===
//each location checks here for unique actions, good?
{action_points:
    -5:->a1->
    -4:->a2->
    -3:->a3->
    -2:->a4->
    -1:->a5->
}
->->

= a1
{ap_updated!=action_points:
    {debug_log("[day script: ds test]")}
    ~npc_update(mary_ann, action, sleeping)
    ~npc_update(april, action, sleeping)
    ~npc_update(june, action, sleeping)
    ~npc_update(mary_ann, location, parent_bedroom)
    ~npc_update(april, location, aprils_room)
    ~npc_update(june, location, junes_room)
    
    ~ap_updated = action_points
-else:
    ~ue_maryann_div = ->ds_test_marital_duty
}
->->

= a2
{ap_updated!=action_points:
    ~npc_update(mary_ann, action, cooking)
    ~npc_update(mary_ann, location, living_room)
    ~npc_update(april, action, playing_guitar)
    ~npc_update(april, location, aprils_room)
    ~npc_update(june, action, drawing)
    ~npc_update(june, location, living_room)
    
    ~ap_updated = action_points
-else:
    ~ue_maryann_div = ERROR.ue_socket_empty
    {daryl?living_room:
        +\ {ap_option("\[offer to cook\]", -1)}
            M: that's so sweet of you to offer!
            ~ap_update(-1)
            ->->
    }     
}
->->

= a3
{ap_updated!=action_points:
    ~npc_set(mary_ann, eating, living_room)
    ~npc_set(april, eating, living_room)
    ~npc_set(june, eating, living_room)
    
    ~ap_updated = action_points
-else:
    {daryl?living_room:
        +\ {ap_option("join family lunch", -1)}
            M: bon apetit!
            nom nom nom
            ~ap_update(-1)
            ->->
    }    
}
->->

= a4
{ap_updated!=action_points:
    ~npc_set(mary_ann, cleaning, living_room)
    ~npc_set(april, playing_guitar, living_room)
    ~npc_set(june, watching_tv, living_room)
    
    ~ap_updated = action_points
//-else:
    
}
->->

= a5
{ap_updated!=action_points:
    ~npc_set(mary_ann, sleeping, parent_bedroom)
    ~npc_set(april, sleeping, aprils_room)
    ~npc_set(june, sleeping, junes_room)
    
    ~ap_updated = action_points
-else:
    {game^mode:
        -unreal: 
            ~ue_maryann_div = ->ds_test_marital_duty
        -ink:
            {daryl?junes_room:<-ds_test_bedtime_story}
            {daryl?parent_bedroom:<-ds_test_marital_duty}
    }
    //<-ds_test_bedtime_story
    //<-ds_test_marital_duty
}
->chores_done

=== ds_test_bedtime_story ===
// {daryl?junes_room:
    +\ {ap_option("read awesome bedtime story", -1)}
        ~ap_update(-1)
        bla bla bla
        //->DONE
        ->chores_done
// }

=== ds_test_marital_duty ===
something else happens?
{daryl?parent_bedroom:
    +\ {ap_option("perform your marital duties", -1)}
        
        ~ap_update(-1)
        {debug_log("ap left: {action_points}")}
        ah ah ah
        //->DONE
        ->chores_done
}