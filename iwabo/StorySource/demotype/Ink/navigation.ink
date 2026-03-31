=== ink_nav ===
= list_actions
//ad a "location" divert target here?
<-go_to
{daryl?garden:
    //<-approach(->ue_farm, "garden", false)
    <-approach(->farm_cluster, "farm cluster", true)
    
    //<-approach(->ue_generator, "generator", false)
    <-approach(->generator_cluster, "generator cluster", true)

    <-approach(->ue_breakerbox, "breaker box", false)
}
{daryl?living_room:
    <-chores_livingroom
    <-approach(->chores_kitchen, "kitchen", true)
    //<-approach(->ue_gym, "weitghs", false)
}
{daryl?parent_bedroom:
    //<-chores_bedroom
    //<-ue_mary_ann
    <-approach(->ue_bed, "bed", false)
    // +\[approach bed\]
    //     <-ue_bed
    //     ->DONE
}
//get special day actions from day_script //is this necessary? 260331
->day_script->//->story_opts->
+{daryl^location==mary_ann^location}\[approach Mary Ann\]
    <-ue_mary_ann
    //<-back
    ->DONE
+{daryl^location==april^location}\[approach April\]
    <-ue_april
    //<-back
    ->DONE
+{daryl^location==june^location}\[approach June\]
    <-ue_june
    //<-back
    ->DONE
+ ->interaction_done
->DONE

= back
+\[done\]
    ->list_actions

= go_to
+go to
    {ue_general_override!=->empt:->ue_general_override}
    ->list_rooms->
//->day_script
//->-> (used to be)
->main_day

= list_rooms
~temp index = 2
->list_all_room_options(index)->
+   ->-> //important part of the solution for double-stay

= list_all_room_options (index)
{
    -index<=LIST_COUNT(location):
        <-room_option(location(index))
        ~index++
        ->list_all_room_options(index)->
}
->->


= room_option (new_loc)
{location !? new_loc:main_day.room_option: {new_loc} is not a location->ERROR}
+{new_loc != daryl^location}[{new_loc}]
    <>{new_loc}
    ~location_update(daryl, new_loc)
    ->enter_room->
    ->->
//solution to double-stay bug
+{LIST_VALUE(new_loc)==LIST_VALUE(LIST_MAX(location))}[stay]
    ->->

=== farm_cluster ===
<-approach(->ue_farm_unit1, "aquaponics unit 1", false)
<-approach(->ue_farm_unit2, "aquaponics unit 2", false)
<-approach(->ue_farm_unit3, "aquaponics unit 2", false)
<-approach(->ue_farm_unit4, "aquaponics unit 2", false)
->DONE

=== generator_cluster ===
<-approach(->ue_generator1, "generator1", false)
<-approach(->ue_generator2, "generator2", false)
<-approach(->ue_generator3, "generator3", false)
<-approach(->ue_generator4, "generator4", false)
->DONE

=== approach(->_target, _txt, _add_done) ===
+\[approach {_txt}\]
    <-_target
    {_add_done:<-ue_done_option}
    ->DONE

// === room ===
// = ir_parent_bedroom
// <-ue_bed
// ->DONE


// = ir_living_room
// <-ue_kitchen_table
// <-ue_kitchen
// <-ue_tv
// <-ue_gym
// ->DONE


// = ir_aprils_room

// ->DONE


// = ir_junes_room

// ->DONE


// = ir_garden
// <-ue_generator
// <-ue_farm
// ->DONE

//=== list_npc ===


