//make all to list?
VAR foresight   = 40 //paranoia
VAR authority   = 10 //dictator
VAR perception  = 70 //surveillance
VAR tinkering   = 0 //meddling
VAR integrity   = 0 //stubbornness
VAR faith       = 0 //dogma
VAR nurturing   = 0 //smothering
VAR strength    = 0 //brutality

VAR tox_switch  = 50//tbd


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

=== function modify_trait(trait_name, amount) ===
{
    -trait_name == "foresight":
        ~foresight  += amount
    -trait_name == "authority":
        ~authority  += amount
    -trait_name == "perception":
        ~perception += amount
    -trait_name == "tinkering":
        ~tinkering  += amount
    -trait_name == "integrity":
        ~integrity  += amount
    -trait_name == "faith":
        ~faith      += amount
    -trait_name == "nurturing":
        ~nurturing  += amount
    -trait_name == "strength":
        ~strength   += amount
}

//=== function 

=== function is_tox(trait_name) ===
{
    -tox_switch <= lookup_trait(trait_name):
        ~return true
    -else:
        ~return false
}

//somehow these options expire if i loop back into the knot that forks to them. So they are + instead of * for now.
=== trait_option(option_text, trait_name, mod_val, mod_text, is_counter_roll, ->pass, ->fail) ===
+\ {option_text} {disp_trait(trait_name, mod_val, mod_text)} 
    //~modify_trait(trait_name, is_cunter_roll -1)
    ->fork_trait_check(trait_name, mod_val, is_counter_roll, pass, fail)




//rename to trait fork? => checks could be inline booleans for checks.
// === check_trait(trait_name, mod_val, ->pass, ->fail) ===
// ~temp trait_val = lookup_trait(trait_name) + mod_val
// ~temp roll_val = roll_d(100) 
// {
//     -trait_val >= roll_val:
//         passed! {trait_val} >= {roll_val}
//         ->pass
//     -else:
//         failed! {trait_val} < {roll_val}
//         ->fail
// }
=== fork_trait_check(trait_name, mod_val, is_counter_roll, ->pass, ->fail) ===
~temp has_passed = 0
{
    -is_counter_roll:
        ~has_passed = roll_counter(trait_name, mod_val)
        ~modify_trait(trait_name, -1)
    -else:
        ~has_passed = roll_trait(trait_name, mod_val)
        ~modify_trait(trait_name, 1)
}
{has_passed: ->pass|->fail}

//=== function trait_check(trait_name, mod_val, is_counter_check) ===
// ~temp debug = 1

// ~temp trait_val = lookup_trait(trait_name) + mod_val
// ~temp roll_val = roll_d(100) 
// {
//     -is_counter_check:
//     {
//         -trait_val < roll_val:
//             {debug: [passed counter: {trait_val} < {roll_val}]}
//             ~return true
//         -else:
//             {debug: [failed counter: {trait_val} >= {roll_val}]}
//             ~return false
//     }
//     -else:
//     {
//         -trait_val >= roll_val:
//             {debug: [passed: {trait_val} >= {roll_val}]}
//             ~return true
//         -else:
//             {debug: [failed: {trait_val} < {roll_val}]}
//             ~return false
//     }
// }

=== function roll_trait(trait_name, mod_val) ===
~temp debug = 1

~temp trait_val = lookup_trait(trait_name) + mod_val
~temp roll_val = roll_d(100)

//~modify_trait(trait_name, 1)
{
    -trait_val >= roll_val:
        {debug: [passed: {trait_val} >= {roll_val}]}
        ~return true
    -else:
        {debug: [failed: {trait_val} < {roll_val}]}
        ~return false
}

=== function roll_counter(trait_name, mod_val) ===
~temp debug = 1

~temp trait_val = lookup_trait(trait_name) + mod_val
~temp roll_val = roll_d(100) 

//~modify_trait(trait_name, -1)
{
    -trait_val < roll_val:
        {debug: [passed counter: {trait_val} < {roll_val}]}
        ~return true
    -else:
        {debug: [failed counter: {trait_val} >= {roll_val}]}
        ~return false
}


=== function disp_trait(trait_name, mod_val, mod_text) ===
<>\[ {trait_name}: {lookup_trait(trait_name) + mod_val}%; {mod_text} \]

//add the mod_text and value to the display string
=== function add_mod (text, val, ref sum_text, ref sum_val) ===
 ~sum_text += " {text}: {val>=0:+}{val};"
 ~sum_val += val



=== function roll_d(dx) ===
~return RANDOM(1, dx)






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