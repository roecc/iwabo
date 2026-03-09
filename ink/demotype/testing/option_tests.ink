=== function option_txt(text, ap_cost) ===
~temp opt_txt = ""
{
    -ap_cost > 0:
        ~opt_txt += "\[-{ap_cost} AP\] "
}
~opt_txt += text
~return opt_txt

=== tst_options ===
in this weave things happen.
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
        ***\ {option_txt("this option costs AP", 1)}
        ***\ {option_txt("this option doesnt", 0) + option_txt("this option costs AP", 1)}
        ---
        ->fork_tunnel->
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
->trait_option("some other option", perception, mod_val, mod_text, not counter_roll, ->pass, ->fail)
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
->trait_option(option_txt("you roll a AP trait", 1), authority, mod_val, mod_text, not counter_roll, pass, fail)

=== tst_options_traitroll_tunnel ===
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
->trait_option("you tunnel a trait roll", authority, mod_val, mod_text, not counter_roll, ->pass, ->fail)
- (pass) //on success
    you pass the roll.
    ->->
	->ERROR.loose_end
- (fail) //on fail
    you fail the roll.
    ->->
	->ERROR.loose_end