

=== tst_options ===
in this weave things happen.
~action_points = 3
*you say something
    which causes something else
    **and you do this
        furthering the weave.
        ->tst_options_traitroll(->pass, ->fail)
        //will still progress to fail, not true cond.
        ---(pass)
        ***even more choices
        ---(fail)
        ***but no difference
        ---
        something else happens
    **and you do that
        causing other things
        ->tst_options_traitroll_tunnel->
        and the tunnel is exited
        ***\ {ap_option("this option costs AP", -1)}
            ~update_ap(-1)
        ***\ {ap_option("this option costs 2 AP", -2)}
            ~update_ap(-2)
        ***\ {ap_option("this option doesnt", -1) + ap_option("this option costs AP", -2)}
        ***other
        ---
        ->fork_tunnel->
        ***
        ---
        exit tunnel
    --
-
->DONE

= fork_tunnel
<-tst_options_traitroll_tunnel
<-tst_roll
->->

//tunnels ending in DONE end the story? need to end in ->->!
=== tst_roll ===
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
->trait_option("some other option", perception, mod_val, mod_text, not counter_roll, 0, ->pass, ->fail)
- (pass) //on success
    this passed
	->->
- (fail) //on fail
    this failed
	->->

=== tst_options_traitroll(->pass, ->fail) ===
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
->trait_option("you roll a AP trait", authority, mod_val, mod_text, not counter_roll, -1, pass, fail)

=== tst_options_traitroll_tunnel ===
//settings
~temp text = "you tunnel a trait roll"
~temp trait = authority
~temp ap_cost = -1

~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
->trait_option(text, trait, mod_val, mod_text, not counter_roll, ap_cost, ->pass, ->fail)
- (pass) //on success
    you pass the roll.
    ->->
	->ERROR.loose_end
- (fail) //on fail
    you fail the roll.
    ->->
	->ERROR.loose_end