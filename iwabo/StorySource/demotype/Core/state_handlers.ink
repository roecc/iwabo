//NPC
LIST location = (none), (living_room), (garden), (parent_bedroom), (aprils_room), (junes_room), (pantry)
LIST action = (none), (playing_guitar), (watching_tv), (cleaning), (cooking), (eating), (reading), (drawing), (sleeping), (waiting), (working), (exercising)
LIST name = (you = -10), (Mary_Ann), (April), (June), (Generator), (Aquaponics), (Generator1), (Generator2), (Generator3), (Generator4), (Aquaponics1), (Aquaponics2), (Aquaponics3), (Aquaponics4)

VAR daryl = (name.you, location.parent_bedroom, action.sleeping, morale.50m)
VAR mary_ann = (name.Mary_Ann, location.living_room, action.none, morale.40m, skill.40m)
VAR april = (name.April, location.aprils_room, action.none, morale.30m)
VAR june = (name.June, location.living_room, action.none, morale.70m)


//RESOURCE MANAGEMENT
LIST repair_state = (broken = 1), (damaged = 2), (fine = 3)
LIST maintain_state = (forgotten), (neglected), (maintained), (well_maintained), (loved)
LIST power_state = (off = 0), (on = 1)

//the amount of power each generator produces when fine
LIST pwr_cost = (n6 = -6), (n5 = -5), (n4 = -4), (n3 = -3), (n2 = -2), (n1 = -1), (p0 = 0), (p1 = 1), (p2 = 2), (p3 = 3), (p4 = 4), (p5 = 5), (p6 = 6)
//instead of class (DO NOT USE CLASS)
LIST sys_type = (Generator), (Farm)
//time since seed/harvest
LIST life_time = (0d = 0), (1d = 1), (2d = 2), (3d = 3), (4d = 4), (5d = 5)

VAR generator = (name.Generator, sys_type.Generator, fine, garden, maintained, on)
VAR farm = (name.Aquaponics, fine, garden, maintained, on)

//when adding here, also add pwr_check
VAR generator1 = (name.Generator1, sys_type.Generator, fine, garden, maintained, on)
VAR generator2 = (name.Generator2, sys_type.Generator, fine, garden, maintained, on)
VAR generator3 = (name.Generator3, sys_type.Generator, fine, garden, maintained, on)
VAR generator4 = (name.Generator4, sys_type.Generator, fine, garden, maintained, on)

VAR farm_unit1 = (name.Aquaponics1, sys_type.Farm, fine, garden, loved, on, life_time.2d)
VAR farm_unit2 = (name.Aquaponics2, sys_type.Farm, fine, garden, loved, on)
VAR farm_unit3 = (name.Aquaponics3, sys_type.Farm, fine, garden, loved, on)
VAR farm_unit4 = (name.Aquaponics4, sys_type.Farm, fine, garden, loved, on)

VAR food = 40

//NPC
=== function npc_set (ref npc, new_act, new_loc)
~temp _debug = 1
~npc_update(npc, action, new_act)
~npc_update(npc, location, new_loc)
{_debug: 
    ~debug_log("[{npc^name} now {npc^action} in {npc^location}]")
}

=== function npc_update(ref npc, list, new_state) ===
~temp _debug = 1
{
    -_debug:
        ~temp old_state = npc^list
}
~npc -= npc^list
~npc += new_state
{_debug: 
    ~debug_log("[{npc^name} updated from {old_state} to {npc^list}]")
}




//SYSTEMS
//generalizing this throws: Line 250: Tried to divert to a target from a variable, but the variable (list_type) didn't contain a divert target, it contained 'broken, damaged, fine'.
=== function repair_update(ref target, value) === 
~temp _debug = 1

~temp old_state = target^repair_state
{LIST_VALUE(target^repair_state)+value>=1:
    {LIST_VALUE(target^repair_state)+value<=LIST_VALUE(LIST_MAX(repair_state)):
        ~target -= old_state
        ~target += repair_state(LIST_VALUE(old_state)+value)
        {_debug:
            ~debug_log("[{target^name} repair state is now {target^repair_state}]")
        }
    }
-else:
    ~old_state = target^repair_state
    ~target -= old_state
    ~target += repair_state.broken
}
{target^repair_state==repair_state.broken:
    ~power_update(target, power_state.off)
}
~power_check()
//~pwr_cost_update(target)


//this works, however its very hard coded and will create problems with upgrades.
// === function pwr_cost_update(ref _target) ===
// ~temp _old_cost = _target^pwr_cost
// {_target^sys_type==sys_type.Generator:
//     {_target^repair_state:
//         -fine:
//             ~_target -= _old_cost
//             ~_target += conf_gen_pwr_cost_fine
//         -damaged:
//             ~_target -= _old_cost
//             ~_target += conf_gen_pwr_cost_damaged
//         //-broken: (turns it off anyway)
//     }
// }

//doesnt need to be run here since they only break on next_day? or do we add crit fail breaking the generator?
// {generator?broken:
//     ~power_update(generator, power_state.off)
//     ~power_update(farm, power_state.off)
// -else:
//     ~power_update(generator, power_state.on)
//     ~power_update(farm, power_state.on)
// }

=== function maintain_update(ref target, value) ===
~temp _debug = 1

{LIST_VALUE(target^maintain_state)+value>=1:
    {LIST_VALUE(target^maintain_state)+value<=LIST_VALUE(LIST_MAX(maintain_state)):
        ~temp old_state = target^maintain_state
        ~target -= old_state
        ~target += maintain_state(LIST_VALUE(old_state)+value)
        {_debug:
            ~debug_log("[{target^name} maintain state is now {target^maintain_state}]")
        }
        -else:
            ~trait_update(tinkering, 1)
    }
}


=== function power_switch(ref _target) ===
~temp _inverse = power_state.off
{_target?off:
    ~_inverse=power_state.on
}
{_inverse==power_state.on && _target^repair_state==broken:
    {_target^name} is broken.
-else:
    ~power_update(_target, _inverse)
    //this really should be done in the check power loop
    {_target^power_state!=_inverse: not enough power.}
    ~buffer()
}

//this will turn something random or the same thing off as soon as something is turned on, should really prevent you from turning on maybe?
=== function power_update(ref _target, value) ===
~power_update_loop(_target, value)

=== function power_update_loop(ref _target, value) ===
~temp _debug = 1
//if not already on/off?
{_target!?value:
    ~_target -= _target^power_state
    ~_target += value
    {_debug: 
        ~debug_log("[{_target^name} power state is now {_target^power_state}]")
    }
}
~power_check()

=== function power_check() ===
~temp _total = 0
~power_add_if_on(generator1, _total)
~power_add_if_on(generator2, _total)
~power_add_if_on(generator3, _total)
~power_add_if_on(generator4, _total)
//reverse for shutdown order
~power_add_if_on(farm_unit1, _total)
~power_add_if_on(farm_unit2, _total)
~power_add_if_on(farm_unit3, _total)
~power_add_if_on(farm_unit4, _total)
total power in system = {_total}

=== function power_add_if_on (ref _target, ref _total) ===
{_target^pwr_cost&&_target^power_state:
    ~temp _cost = LIST_VALUE(_target^pwr_cost)
    //power in system = {_total}
    {_target?power_state.on:
        {_total+_cost<0:
            ~power_update_loop(_target, power_state.off)
        -else:
            {_target?repair_state.damaged && _target?sys_type.Generator:
                ~_cost = _cost/2
            }
            ~_total += _cost
        }
    }
-else:
    ~debug_log("ERROR: power_add_if_on() => _target not pwr")
}

//LOCATIONS
=== enter_room ===
{daryl^location:
    -living_room:
        You enter the large domed living room.
    -garden:
        //{mary_ann?garden: mary ann is standing there.}
        The enormous power house, your makeshift garden and vertical farm, covered in thick green and illuminated by countless grow-lamps.
    -parent_bedroom:
        Your well made bed is surrounded by overstuffed book shelves.
    -aprils_room:
        The floor of your daughters room is littered with paints, brushes, books, fabrics and little snippets of yarn.
    -junes_room:
        Toys half-heartedly thrown into the various boxes and half still posing mortal danger to any un-soled feet who dare enter.
    -pantry:
        Rows upon rows of conserves, dehydrated or freezedried, powdered or bottled, tightly stacked upon eachother from floor to ceiling.
}
->check_npc(daryl^location)->
->->

= check_npc (loc)
{mary_ann?loc:Mary Ann is {mary_ann^action}}
{april?loc:April is {april^action}}
{june?loc:June is {june^action}}
->->

//could be generalized //could be knot, diverting to ->enter_room-> if daryl
=== function location_update(ref npc, new_location)
~temp _debug = 0
{
    -_debug:
        ~temp old_loc = npc^location
}
~npc -= location^npc
~npc += new_location
{_debug: 
    ~debug_log("{npc^name} moved from {old_loc} to {npc^location}")
}
//->enter_room->

