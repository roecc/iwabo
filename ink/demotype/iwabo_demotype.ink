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
INCLUDE Unreal/sockets.ink
INCLUDE DayStructure/DayScripts.ink
INCLUDE DayStructure/DayScripts/ds_2.ink
INCLUDE DayStructure/DayScripts/ds_test.ink
INCLUDE Core/day_handlers.ink
INCLUDE Core/state_handlers.ink
INCLUDE Core/day_actions.ink
INCLUDE DayStructure/DayScripts/june_sick.ink
INCLUDE DayStructure/DayScripts/ds_prefab.ink


VAR set_ap_per_day = 5

~SEED_RANDOM(256011)

IWABO DEMOTYPE DRAFT v0.5.260227

//->dt_d1_a1
//->tst_the_note
//->tst_options

->next_day(->ds_1)
//->end_story



=== ERROR ===
ERROR
->end_story

=loose_end
ERROR: You forgot to edit the default divert!
->end_story


=== end_story ===
->END
