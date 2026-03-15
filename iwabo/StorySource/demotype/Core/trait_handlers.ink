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

=== function trait_update(trait_name, amount) ===
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
{debug: {debug_log("[{trait_name}{amount > 0:++|--} => {ret_val}]")}}
~return ret_val

=== function modify_trait_helper(trait_name, ref r_trait_val, amount) ===
~temp debug = 1

~r_trait_val += amount
{
    -r_trait_val < 0:
        {debug: {debug_log("[{trait_name} underflowed: {r_trait_val}]")}}
        ~r_trait_val = 0
    -r_trait_val > 100:
        {debug: {debug_log("[{trait_name} overflowed: {r_trait_val}]")}}
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