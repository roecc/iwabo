//NPC
LIST location = (none), (living_room), (garden), (parent_bedroom), (aprils_room), (junes_room), (pantry)
LIST action = (none), (playing_guitar), (watching_tv), (cleaning), (cooking), (eating), (reading), (drawing), (sleeping)
LIST name = (you), (Mary_Ann), (April), (June), (Generator), (Aquaponics)

VAR daryl = (name.you, location.parent_bedroom, action.none, morale.50m)
VAR mary_ann = (name.Mary_Ann, location.living_room, action.cooking, morale.40m, skill.40m)
VAR april = (name.April, location.aprils_room, action.playing_guitar, morale.30m)
VAR june = (name.June, location.living_room, action.drawing, morale.70m)


//RESOURCE MANAGEMENT
LIST repair_state = (broken = 1), (damaged = 2), (fine = 3)
LIST maintain_state = (forgotten), (neglected), (maintained), (well_maintained), (loved)
LIST power_state = (off = 0), (on = 1)

VAR generator = (name.Generator, fine, garden, maintained, on)
VAR farm = (name.Aquaponics, fine, garden, maintained, on)

VAR food = 40

//NPC
=== function npc_set (ref npc, new_act, new_loc)
~temp debug = 1
~npc_update(npc, action, new_act)
~npc_update(npc, location, new_loc)
{debug: {npc^name} now {npc^action} in {npc^location}}

=== function npc_update(ref npc, list, new_state) ===
~temp debug = 0
{
    -debug:
        ~temp old_state = npc^list
}
~npc -= list^npc
~npc += new_state
{debug: {npc^name} updated from {old_state} to {npc^list}}




//SYSTEMS
//generalizing this throws: Line 250: Tried to divert to a target from a variable, but the variable (list_type) didn't contain a divert target, it contained 'broken, damaged, fine'.
=== function repair_update(ref target, value) === 
~temp debug = 1

{LIST_VALUE(target^repair_state)+value>=1:
    {LIST_VALUE(target^repair_state)+value<=LIST_VALUE(LIST_MAX(repair_state)):
        ~temp old_state = target^repair_state
        ~target -= old_state
        ~target += repair_state(LIST_VALUE(old_state)+value)
        {debug: [{target^name} repair state is now {target^repair_state}]}
        {debug:
            ~debug_message = "[{target^name} repair state is now {target^repair_state}] "
        }
    }
}
{generator?broken:
    ~power_update(generator, power_state.off)
    ~power_update(farm, power_state.off)
-else:
    ~power_update(generator, power_state.on)
    ~power_update(farm, power_state.on)
}

=== function maintain_update(ref target, value) ===
~temp debug = 1

{LIST_VALUE(target^maintain_state)+value>=1:
    {LIST_VALUE(target^maintain_state)+value<=LIST_VALUE(LIST_MAX(maintain_state)):
        ~temp old_state = target^maintain_state
        ~target -= old_state
        ~target += maintain_state(LIST_VALUE(old_state)+value)
        {debug: [{target^name} maintain state is now {target^maintain_state}]}
        {debug:
            ~debug_message = "[{target^name} maintain state is now {target^maintain_state}]"
        }
        -else:
            ~trait_update(tinkering, 1)
    }
}

=== function power_update(ref target, value) ===
~temp debug = 1

{target!?value:
    ~target -= target^power_state
    ~target += value
    {debug: [{target^name} power state is now {target^power_state}]}   
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
~temp debug = 0
{
    -debug:
        ~temp old_loc = npc^location
}
~npc -= location^npc
~npc += new_location
{debug: {npc^name} moved from {old_loc} to {npc^location}}
//->enter_room->