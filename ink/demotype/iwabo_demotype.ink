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

LIST location = none, living_room, garden, parent_bedroom, aprils_room, junes_room, pantry
LIST name = Daryl, Mary_Ann, April, June

VAR daryl = (name.Daryl, location.none)
VAR mary_ann = (name.Mary_Ann, location.none)
VAR april = (name.April, location.none)
VAR june = (name.June, location.none)




~SEED_RANDOM(256011)

IWABO DEMOTYPE DRAFT v0.5.260227

//write a short interaction with a character that uses trait checks and counter checks. - DONE
//->dt_d1_a1
{LIST_ALL(location) ^ mary_ann}

~location_update(mary_ann, location.garden)

->main_day
//->tst_the_note
//->tst_options


=== function location_update(npc, new_location)
~temp debug = 0
{
    -debug:
        ~temp old_loc = list_get(npc, location)
}
~npc -= LIST_ALL(location) ^ mary_ann
~npc += new_location
{debug: {list_get(npc, name)} moved from {old_loc} to {list_get(npc, location)}}

=== function list_get(target, list) ===
~return LIST_ALL(list) ^ target

=== ERROR ===
=loose_end
ERROR: You forgot to edit the default divert!
->end_story


=== end_story ===
->END
