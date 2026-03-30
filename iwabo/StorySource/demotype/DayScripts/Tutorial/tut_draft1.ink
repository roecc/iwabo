=== tut_draft1 ===

->DONE

=== tut_d1_gen ===

->DONE

=== tut_d1_farm ===
->DONE


=== ds_tut_d1 ===
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
    ~npc_update(daryl, action, action.none)
    //npc, action, location
    // ~npc_set(mary_ann, sleeping, junes_room)
    ~ap_updated = action_points
}
->->

= a2
{ap_updated!=action_points:
    ~ap_updated = action_points    
}
->->

= a3
{ap_updated!=action_points:
    ~ap_updated = action_points
}
->->

= a4
{ap_updated!=action_points:
    ~ap_updated = action_points
}
->->

= a5
{ap_updated!=action_points:
    ~ap_updated = action_points
}
->->
