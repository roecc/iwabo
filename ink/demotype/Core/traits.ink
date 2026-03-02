VAR foresight   = 40 //paranoia
VAR authority   = 10 //dictator
VAR perception  = 40 //surveillance
VAR tinkering   = 0 //meddling
VAR integrity   = 0 //stubbornness
VAR faith       = 0 //dogma
VAR nurturing   = 0 //smothering
VAR strength    = 0 //brutality


=== function disp_trait(trait_name, mod_val, mod_text) ===
<>\{ {trait_name}: {lookup_trait(trait_name) + mod_val}%; {mod_text} \}

=== function lookup_trait(trait_name) ===
~temp trait_val = -1
{
    -trait_name == "foresight":
        ~trait_val = foresight
    -trait_name == "authority":
        ~trait_val = authority
    -trait_name == "perception":
        ~trait_val = perception
    -trait_name == "tinkering":
        ~trait_val = tinkering
    -trait_name == "integrity":
        ~trait_val = integrity
    -trait_name == "faith":
        ~trait_val = faith
    -trait_name == "nurturing":
        ~trait_val = nurturing
    -trait_name == "strength":
        ~trait_val = strength
}
~return trait_val

=== check_trait(trait_name, mod_val, ->pass, ->fail) ===
~temp trait_val = lookup_trait(trait_name) + mod_val
~temp roll_val = roll_d(100) 
{
    -trait_val >= roll_val:
        passed! {trait_val} >= {roll_val}
        ->pass
    -else:
        failed! {trait_val} < {roll_val}
        ->fail
}

=== function roll_d(dx) ===
~return RANDOM(1, dx)





//{fill_condition: {add_mod("fill_mod_text", 0, mod_text, mod_val)}}

=== test
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
//->trait_option("fill_option_text", "fill_trait_name", mod_val, mod_text, ->pass, ->fail)
- (pass) //on success
    ->ERROR.loose_end
- (fail) //on fail
    ->ERROR.loose_end





=== test_snip
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
//->trait_option("fill_option_text", "fill_trait_name", mod_val, mod_text, ->pass, ->fail)
- (pass) //on success
	->ERROR.loose_end
- (fail) //on fail
	->ERROR.loose_end








/*
VAR outcome = true

VAR foresight   = 0 //paranoia
VAR authority   = 0 //respect -> authority? powermonger?
VAR religion    = 0 //dogma
VAR reflection  = 0 //rumination/narcissism
VAR discipline  = 0 //detachment / 
VAR creativity  = 0 //escapism
VAR strength    = 0 //brutality
VAR cultiation  = 0 //exploitation
VAR tinkering   = 0 //meddling
*/