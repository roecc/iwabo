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
INCLUDE DayScripts/ds_test.ink
INCLUDE Core/day_handlers.ink
INCLUDE Core/state_handlers.ink
INCLUDE Core/day_actions.ink
INCLUDE DayScripts/june_sick.ink
INCLUDE DayScripts/ds_prefab.ink
INCLUDE Core/morale_handlers.ink
INCLUDE Ink/navigation.ink
INCLUDE DayScripts/walled_garden.ink
INCLUDE DayScripts/WalledGarden/walled_blockout.ink
INCLUDE DayScripts/WalledGarden/walled_fast.ink





//INCLUDE Unreal/external.ink


LIST mode = (ink), (unreal)
VAR game = (mode.ink)
VAR debug = true
VAR buffer_time = 0.01

VAR debug_message = ""  

VAR set_ap_per_day = 5

~SEED_RANDOM(256011)

IWABO DEMOTYPE DRAFT v0.5.260227.117
//->dt_d1_a1
//->tst_the_note
//->tst_options
+[start]
-
->next_day(->ds_walled_garden)

//->end_story
// ->tst_the_note

//->END


=== ERROR ===
ERROR
->end_story

=loose_end
ERROR: You forgot to edit the default divert!
->end_story

//but that means it will still be considered interactable. should find a way to disable interaction on empty.
=ue_socket_empty
this socket lead nowhere.
+ok
->DONE

=== end_story ===
->END
