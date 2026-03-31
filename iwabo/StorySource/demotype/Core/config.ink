

=== function conf_init () ===
~temp _gen_pwr_cost = p4
~temp _farm_pwr_cost = n4

~conf_gens(_gen_pwr_cost)
~conf_farms(_farm_pwr_cost)
~buffer()

=== function conf_gens (_pwr_cost) ===
~generator1 += _pwr_cost
~generator2 += _pwr_cost
~generator3 += _pwr_cost
~generator4 += _pwr_cost

=== function conf_farms (_pwr_cost) ===
~farm_unit1 += _pwr_cost
~farm_unit2 += _pwr_cost
~farm_unit3 += _pwr_cost
~farm_unit4 += _pwr_cost