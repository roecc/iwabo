//write multiple generic descriptions of locations and tunnel through them here. otherwise write specific descriptions here.
=== ds_prefab ===
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
    //npc, action, location
    // ~npc_set(mary_ann, sleeping, junes_room)
    // ~npc_set(april, watching_tv, living_room)
    // ~npc_set(june, sleeping, junes_room)
    
    ~ap_updated = action_points
//-else:
    //day-specific actions / conditions (always tunnels!)
    // {daryl?junes_room:
    //     +\ {ap_option("\[wait\]", -1)}
    //         You sit next to your sick daugter.
    //         ~ap_update(-1)
    //         ->->
    // }
}
->->

= a2
{ap_updated!=action_points:
    // ~npc_set(mary_ann, cooking, living_room)
    // ~npc_set(april, reading, living_room)
    // ~npc_set(june, eating, living_room)

    ~ap_updated = action_points    
}
->->

= a3
{ap_updated!=action_points:
    // ~npc_set(mary_ann, eating, living_room)
    // ~npc_set(april, eating, living_room)
    // ~npc_set(june, eating, living_room)
    
    ~ap_updated = action_points
// -else:
//     {daryl?living_room:
//         +\ {ap_option("join family lunch", -1)}
//             M: bon apetit!
//             nom nom nom
//             ~ap_update(-1)
//             ->->
//     }   
}
->->

= a4
{ap_updated!=action_points:
    // ~npc_set(mary_ann, cleaning, living_room)
    // ~npc_set(april, playing_guitar, aprils_room)
    // ~npc_set(june, watching_tv, living_room)
    
    ~ap_updated = action_points
//-else:
    
}
->->

= a5
{ap_updated!=action_points:
    // ~npc_set(mary_ann, sleeping, parent_bedroom)
    // ~npc_set(april, sleeping, aprils_room)
    // ~npc_set(june, sleeping, junes_room)
    
    ~ap_updated = action_points
//-else:
    //<-ds_test_bedtime_story
}
->->
