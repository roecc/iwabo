VAR conf_gen_pwr_cost_fine = pwr_cost.p4
VAR conf_farm_pwr_cost = pwr_cost.n2

//VAR conf_farm_heal_time = 2
//for now, grow time defines heal and growth, is reset on every change (fine ->damaged, damaged -> fine)
VAR conf_farm_grow_time = life_time.2d

VAR conf_gen1_rep = fine
VAR conf_gen2_rep = fine
VAR conf_gen3_rep = fine
VAR conf_gen4_rep = fine

VAR conf_farm1_rep = damaged
VAR conf_farm2_rep = broken
VAR conf_farm3_rep = fine
VAR conf_farm4_rep = fine

LIST debug_flags = (d_life_time), (d_power), (d_repair), (d_maintain), d_npc, (d_action_points), (d_daily_damage), (d_next_day), d_rolls
LIST debug_options = do_disable_wear_and_tear

=== function conf_init () ===
~temp _gen_pwr_cost = conf_gen_pwr_cost_fine
~temp _farm_pwr_cost = conf_farm_pwr_cost

~conf_gens(_gen_pwr_cost)
~conf_farms(_farm_pwr_cost)
~buffer()

=== function conf_gens (_pwr_cost) ===
~generator1 += _pwr_cost
~generator2 += _pwr_cost
~generator3 += _pwr_cost
~generator4 += _pwr_cost

~generator1 += conf_gen1_rep
~generator2 += conf_gen2_rep
~generator3 += conf_gen3_rep
~generator4 += conf_gen4_rep

=== function conf_farms (_pwr_cost) ===
~farm_unit1 += _pwr_cost
~farm_unit2 += _pwr_cost
~farm_unit3 += _pwr_cost
~farm_unit4 += _pwr_cost

~farm_unit1 += conf_farm1_rep
~farm_unit2 += conf_farm2_rep
~farm_unit3 += conf_farm3_rep
~farm_unit4 += conf_farm4_rep

