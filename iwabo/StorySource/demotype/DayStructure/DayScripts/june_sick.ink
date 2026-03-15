
//write multiple generic descriptions of locations and tunnel through them here. otherwise write specific descriptions here.
=== ds_june_sick ===
//each location checks here for unique actions, good?
{action_points:
    -5:->a1->
    -4:->a2->
    -3:->a3->
    -2:->a4->
    -1:->a5->
}
->->

//set unreal sockets here
= a1
{ap_updated!=action_points:
    {debug_log("[day script: june sick]")}
    ~npc_set(mary_ann, sleeping, junes_room)
    ~npc_set(april, watching_tv, living_room)
    ~npc_set(june, sleeping, junes_room)
    
    ~ap_updated = action_points
-else:
    {daryl?junes_room:
        +\ {ap_option("\[wait\]", -1)}
            You sit next to your sick daugter.
            ~ap_update(-1)
            ->->
    }
    {daryl?living_room:
        //how disable a standard option from here? ->watch TV
        //empty unreal plug, but how in ink?
        +\ {ap_option("\[join April watching TV\]", -1)}
            You sit next to your healthy daugter.
            ~ap_update(-1)
            ->->
    }
}
->->

= a2
{ap_updated!=action_points:
    ~npc_set(mary_ann, reading, junes_room)
    ~npc_set(april, eating, living_room)
    
    ~ap_updated = action_points
// -else:
//     {daryl?junes_room:
//         +\ {ap_option("\[offer to cook\]", -1)}
//             M: that's so sweet of you to offer!
//             ~ap_update(-1)
//             ->->
//     }     
}
->->

= a3
{ap_updated!=action_points:
    ~npc_set(april, playing_guitar, living_room)
    
    ~ap_updated = action_points
-else:
    {daryl?living_room:
        +\ {ap_option("\[listen to april playing\]", -1)}
            strum strum strum
            ~ap_update(-1)
            ->->
    }    
}
->->

= a4
{ap_updated!=action_points:
    
    ~ap_updated = action_points
//-else:
    
}
->->

= a5
{ap_updated!=action_points:
    ~npc_set(mary_ann, sleeping, junes_room)
    ~npc_set(april, sleeping, aprils_room)
    
    ~ap_updated = action_points
-else:
    <-ds_test_bedtime_story
}
->->
