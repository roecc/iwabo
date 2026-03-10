INCLUDE Core/trait_settings.ink
INCLUDE Core/trait_handlers.ink
INCLUDE Core/trait_rolls.ink

INCLUDE testing/papernote.ink

INCLUDE Demotype/Day1/dt_d1_a1.ink
INCLUDE Demotype/CharacterCreation/CarScene.ink
INCLUDE Demotype/Day1/dt_d1_draft.ink
INCLUDE ResourceManagement/rm_test.ink
INCLUDE testing/option_tests.ink
INCLUDE Core/ap_handlers.ink
INCLUDE ResourceManagement/rm_test2.ink
INCLUDE DayStructure/ds_test.ink



LIST location = (none), (living_room), (garden), (parent_bedroom), (aprils_room), (junes_room), (pantry)
//~location = (none, living_room, garden, parent_bedroom, aprils_room, junes_room, pantry)
LIST action = (none), (playing_guitar), (watching_tv), (cleaning), (cooking), (eating), (reading), (drawing), (sleeping)
LIST name = (you), (Mary_Ann), (April), (June)
//~name = (Daryl, Mary_Ann, April, June)

// VAR daryl = (name.you, location.none, action.none)
// VAR mary_ann = (name.Mary_Ann, location.none, action.none)
// VAR april = (name.April, location.none, action.none)
// VAR june = (name.June, location.none, action.none)
VAR daryl = (name.you, location.parent_bedroom, action.none)
VAR mary_ann = (name.Mary_Ann, location.living_room, action.cooking)
VAR april = (name.April, location.aprils_room, action.playing_guitar)
VAR june = (name.June, location.living_room, action.drawing)




~SEED_RANDOM(256011)

IWABO DEMOTYPE DRAFT v0.5.260227

//write a short interaction with a character that uses trait checks and counter checks. - DONE
//->dt_d1_a1
///{mary_ann^location}
//~location_update(daryl, location.garden)

///~location_update(mary_ann, location.garden)

//init
///~location_update(daryl, location.parent_bedroom)
->next_day(->ds_1)
//->main_day
//->tst_the_note
//->tst_options


//could be generalized //could be knot, diverting to ->enter_room-> if daryl
=== function location_update(ref npc, new_location)
~temp debug = 0
{
    -debug:
        ~temp old_loc = npc^location
}
~npc -= location^npc
~npc += new_location
{debug: {npc^name} moved from {old_loc} to {npc^location}}
//->enter_room->


=== ERROR ===
->end_story

=loose_end
ERROR: You forgot to edit the default divert!
->end_story


=== end_story ===
->END
