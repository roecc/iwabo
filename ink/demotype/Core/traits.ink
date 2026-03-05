LIST traits = foresight, authority, perception, tinkering, integrity, faith, nurturing, strength
LIST tox_traits = paranoia, dictator, surveillance, meddling, stubbornness, dogma, smothering, brutality
//make all to list?
VAR foresight_val   = 10 //paranoia
VAR authority_val   = 100 //dictator //domineering
VAR perception_val  = 40 //surveillance
VAR tinkering_val   = 0 //meddling
VAR integrity_val   = 0 //stubbornness
VAR faith_val       = 0 //dogma //piety
VAR nurturing_val  = 0 //smothering
VAR strength_val    = 0 //brutality

VAR tox_switch  = 50//tbd


=== function lookup_trait_val(trait_name) ===
//ensure non_tox name
{
    -LIST_ALL(tox_traits) ? trait_name:
        ~trait_name = traits(LIST_VALUE(trait_name))
}
~temp trait_val = -1
{
    -trait_name == foresight:
        ~trait_val = foresight_val
    -trait_name == authority:
        ~trait_val = authority_val
    -trait_name == perception:
        ~trait_val = perception_val
    -trait_name == tinkering:
        ~trait_val = tinkering_val
    -trait_name == integrity:
        ~trait_val = integrity_val
    -trait_name == faith:
        ~trait_val = faith_val
    -trait_name == nurturing:
        ~trait_val = nurturing_val
    -trait_name == strength:
        ~trait_val = strength_val
}
~return  trait_val

=== function get_other_name(trait_name) ===
{
    -LIST_ALL(tox_traits) ? trait_name:
        ~return traits(LIST_VALUE(trait_name))
    -LIST_ALL(traits) ? trait_name:
        ~return tox_traits(LIST_VALUE(trait_name))
    -else:
        ERROR: trait not found.
}

=== function modify_trait(trait_name, amount) ===
~temp debug = 1
~temp ret_val = -1
{
    -trait_name == foresight:
        ~modify_trait_helper(trait_name, foresight_val, amount)
        ~ret_val = foresight_val
    -trait_name == authority:
        ~modify_trait_helper(trait_name, authority_val, amount)
        ~ret_val = authority_val
    -trait_name == perception:
        ~modify_trait_helper(trait_name, perception_val, amount)
        ~ret_val = perception_val
    -trait_name == tinkering:
        ~modify_trait_helper(trait_name, tinkering_val, amount)
        ~ret_val = tinkering_val
    -trait_name == integrity:
        ~modify_trait_helper(trait_name, integrity_val, amount)
        ~ret_val = integrity_val
    -trait_name == faith:
        ~modify_trait_helper(trait_name, faith_val, amount)
        ~ret_val = faith_val
    -trait_name == nurturing:
        ~modify_trait_helper(trait_name, nurturing_val, amount)
        ~ret_val = nurturing_val
    -trait_name == strength:
        ~modify_trait_helper(trait_name, strength_val, amount)
        ~ret_val = strength_val
}
{debug:[{trait_name}{amount > 0:++|--} => {ret_val}]}
~return ret_val

=== function modify_trait_helper(trait_name, ref r_trait_val, amount) ===
~temp debug = 1

~r_trait_val += amount
{
    -r_trait_val < 0:
        {debug: [{trait_name} underflowed: {r_trait_val}]}
        ~r_trait_val = 0
    -r_trait_val > 100:
        {debug: [{trait_name} overflowed: {r_trait_val}]}
        ~r_trait_val = 100
}
~return r_trait_val



//=== function 

=== function is_tox(trait_name) ===
{
    -tox_switch <= lookup_trait_val(trait_name):
        ~return true
    -else:
        ~return false
}

//somehow these options expire if i loop back into the knot that forks to them. So they are + instead of * for now.
=== trait_option(option_text, trait_name, mod_val, mod_text, is_counter_roll, ->pass, ->fail) ===
+\ {option_text} {disp_trait(trait_name, mod_val, mod_text, is_counter_roll)} 
    ->fork_trait_check(trait_name, mod_val, is_counter_roll, pass, fail)

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

=== function roll_trait(trait_name, mod_val) ===
~temp debug = 1

~temp trait_val = lookup_trait_val(trait_name) + mod_val
~temp roll_val = roll_d(100)
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

~temp trait_val = lookup_trait_val(trait_name) + mod_val
~temp roll_val = roll_d(100) 
{
    -trait_val < roll_val:
        {debug: [passed counter: {trait_val} < {roll_val}]}
        ~return true
    -else:
        {debug: [failed counter: {trait_val} >= {roll_val}]}
        ~return false
}


=== function disp_trait(trait_name, mod_val, mod_text, is_counter_roll) ===
~temp disp_name = trait_name
{
    -is_counter_roll: 
        ~disp_name = get_other_name(disp_name)
}
<>\[ {disp_name}: {lookup_trait_val(trait_name) + mod_val}%; {mod_text} \]

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