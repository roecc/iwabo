


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


