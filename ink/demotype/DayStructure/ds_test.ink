=== ds_1 ===
//each location should check here for unique actions?
{action_points:
    // -5:{a1==0:->a1->}
    -5:->a1->
    // -4:{a2==0:->a2->}
    -4:->a2->
    // -3:{a3==0:->a3->}
    -3:->a3->
    // -2:{a4==0:->a4->}
    -2:->a4->
    // -1:{a5==0:->a5->}
    -1:->a5->
}
->->
->ERROR.loose_end

= a1
~npc_update(mary_ann, action, sleeping)
~npc_update(april, action, sleeping)
~npc_update(june, action, sleeping)
~npc_update(mary_ann, location, parent_bedroom)
~npc_update(april, location, aprils_room)
~npc_update(june, location, junes_room)
->->
= a2
~npc_update(mary_ann, action, cooking)
~npc_update(mary_ann, location, living_room)
~npc_update(april, action, playing_guitar)
~npc_update(april, location, aprils_room)
~npc_update(june, action, drawing)
~npc_update(june, location, living_room)
->->
= a3
~npc_set(mary_ann, eating, living_room)
~npc_set(april, eating, living_room)
~npc_set(june, eating, living_room)
->->
= a4
~npc_set(mary_ann, cleaning, living_room)
~npc_set(april, playing_guitar, living_room)
~npc_set(june, watching_tv, living_room)
->->
= a5
~npc_set(mary_ann, sleeping, parent_bedroom)
~npc_set(april, sleeping, aprils_room)
~npc_set(june, sleeping, junes_room)
->->

=== function npc_set (ref npc, new_act, new_loc)
~temp debug = 1
~npc_update(npc, action, new_act)
~npc_update(npc, location, new_loc)
{debug: {npc^name} now {npc^action} in {npc^location}}

=== function npc_update(ref npc, list, new_state) ===
~temp debug = 0
{
    -debug:
        ~temp old_state = npc^list
}
~npc -= list^npc
~npc += new_state
{debug: {npc^name} updated from {old_state} to {npc^list}}