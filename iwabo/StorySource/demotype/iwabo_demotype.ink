INCLUDE Core/trait_settings.ink
INCLUDE Core/trait_handlers.ink
INCLUDE Core/trait_rolls.ink

INCLUDE testing/papernote.ink

INCLUDE Demotype/Day1/dt_d1_a1.ink
INCLUDE Demotype/CharacterCreation/CarScene.ink
INCLUDE Demotype/Day1/dt_d1_draft.ink
INCLUDE testing/option_tests.ink
INCLUDE Core/ap_handlers.ink
INCLUDE Unreal/sockets.ink
INCLUDE DayStructure/DayScripts/ds_test.ink
INCLUDE Core/day_handlers.ink
INCLUDE Core/state_handlers.ink
INCLUDE Core/day_actions.ink
INCLUDE DayStructure/DayScripts/june_sick.ink
INCLUDE DayStructure/DayScripts/ds_prefab.ink
INCLUDE Core/morale_handlers.ink
//INCLUDE Unreal/external.ink





VAR debug_message = ""  

VAR set_ap_per_day = 5

~SEED_RANDOM(256011)

IWABO DEMOTYPE DRAFT v0.5.260227.42 # Linetime: 0.01
// # ue_debug mary_ann: {mary_ann}
// # ue_debug daryl: {daryl}

~ue_debug("daryl: {daryl}")
~ue_debug("mary_ann: {mary_ann}")

//->dt_d1_a1
//->tst_the_note
//->tst_options
// loooong line # Linetime: 10
// ~morale_up date(mary_ann, 12)
// ~morale_update(mary_ann, 120)
// ~morale_update(mary_ann, -1242)
// ~morale_update(mary_ann, 12)
// // ~skill_update(mary_ann, 1)
// test
// ~skill_update(mary_ann, 0)

->next_day(->ds_1)

//->end_story
// ->tst_the_note

//->END


=== ERROR ===
ERROR
->end_story

=loose_end
ERROR: You forgot to edit the default divert!
->end_story

=ue_socket_empty
this socket lead nowhere.
->DONE

=== end_story ===
->END
