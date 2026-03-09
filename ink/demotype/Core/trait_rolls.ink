//somehow these options expire if i loop back into the knot that forks to them. So they are + instead of * for now.
=== trait_option(option_text, trait_name, mod_val, mod_text, is_counter_roll, ap_cost, ->pass, ->fail) ===
~temp tmp_txt = option_text + " {disp_trait(trait_name, mod_val, mod_text, is_counter_roll)}"
+\ {ap_option(tmp_txt, ap_cost)} 
    //{ap_cost>0:{update_ap(ap_cost)}}
    ~ap_update(ap_cost)
    ->fork_trait_roll(trait_name, mod_val, is_counter_roll, pass, fail)

=== fork_trait_roll(trait_name, mod_val, is_counter_roll, ->pass, ->fail) ===
~temp has_passed = 0
{
    -is_counter_roll:
        ~has_passed = roll_counter(trait_name, mod_val)
        ~trait_update(trait_name, -1)
    -else:
        ~has_passed = trait_roll(trait_name, mod_val)
        ~trait_update(trait_name, 1)
}
{has_passed: ->pass|->fail}

=== function trait_roll(trait_name, mod_val) ===
~temp debug = 1

~temp trait_val = lookup_trait_val(trait_name) + mod_val
~temp roll_val = roll_d(100)
{
    -trait_val >= roll_val:
        {debug: [passed: {trait_val} >= {roll_val}] }
        ~return true
    -else:
        {debug: [failed: {trait_val} < {roll_val}] }
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


