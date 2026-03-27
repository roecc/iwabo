LIST morale = (0m = 0), (1m), (2m), (3m), (4m), (5m), (6m), (7m), (8m), (9m), (10m), (11m), (12m), (13m), (14m), (15m), (16m), (17m), (18m), (19m), (20m), (21m), (22m), (23m), (24m), (25m), (26m), (27m), (28m), (29m), (30m), (31m), (32m), (33m), (34m), (35m), (36m), (37m), (38m), (39m), (40m), (41m), (42m), (43m), (44m), (45m), (46m), (47m), (48m), (49m), (50m), (51m), (52m), (53m), (54m), (55m), (56m), (57m), (58m), (59m), (60m), (61m), (62m), (63m), (64m), (65m), (66m), (67m), (68m), (69m), (70m), (71m), (72m), (73m), (74m), (75m), (76m), (77m), (78m), (79m), (80m), (81m), (82m), (83m), (84m), (85m), (86m), (87m), (88m), (89m), (90m), (91m), (92m), (93m), (94m), (95m), (96m), (97m), (98m), (99m), (100m)
LIST skill = (1m), (2m), (3m), (4m), (5m), (6m), (7m), (8m), (9m), (10m), (11m), (12m), (13m), (14m), (15m), (16m), (17m), (18m), (19m), (20m), (21m), (22m), (23m), (24m), (25m), (26m), (27m), (28m), (29m), (30m), (31m), (32m), (33m), (34m), (35m), (36m), (37m), (38m), (39m), (40m), (41m), (42m), (43m), (44m), (45m), (46m), (47m), (48m), (49m), (50m), (51m), (52m), (53m), (54m), (55m), (56m), (57m), (58m), (59m), (60m), (61m), (62m), (63m), (64m), (65m), (66m), (67m), (68m), (69m), (70m), (71m), (72m), (73m), (74m), (75m), (76m), (77m), (78m), (79m), (80m), (81m), (82m), (83m), (84m), (85m), (86m), (87m), (88m), (89m), (90m), (91m), (92m), (93m), (94m), (95m), (96m), (97m), (98m), (99m), (100m)

=== function morale_update (ref npc, val) ===
~temp _debug = 1
{npc^morale:
    ~temp old_val = LIST_VALUE(npc^morale)
    // ~debug_log("{npc^name}'s morale is {LIST_VALUE(npc^morale)}")
    ~npc -= morale
    {
        -old_val+val>100:
            ~npc += morale (100)
        -old_val+val<1:
            ~npc += morale (0)
        -else:
            ~npc += morale(old_val + val)
            
    }
    {_debug: {debug_log("{npc^name}'s morale now is {LIST_VALUE(npc^morale)}")}}
-else:
    {debug_log("ERROR: no morale assigned")}
}

//for test only (pretty sure)
=== function skill_update (ref npc, val) ===
{npc^skill:
    ~temp old_val = LIST_VALUE(npc^skill)
    {npc^name}'s skill is {LIST_VALUE(npc^skill)}
    ~npc -= skill
    {npc^name}'s skill is {LIST_VALUE(npc^skill)}
    ~npc += skill(old_val + val)
    {npc^name}'s skill is {LIST_VALUE(npc^skill)}
-else:
    ERROR: no skill assigned
}


=== function morale_val(npc) ===
~return LIST_VALUE(npc^morale)



// === function one_to_hundred (index) ===
// {index<100:
//     ~index++
//     <>, ({index}m)
//     ~quickloop(index)
// }