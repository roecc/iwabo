VAR conf_gen_pwr_cost_fine = pwr_cost.p4
VAR conf_farm_pwr_cost = pwr_cost.n2

VAR conf_gen1_rep = fine
VAR conf_gen2_rep = fine
VAR conf_gen3_rep = fine
VAR conf_gen4_rep = fine

LIST debug_flags = (d_life_time), d_power, (d_repair), d_maintain, d_npc, d_action_points, d_daily_damage

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