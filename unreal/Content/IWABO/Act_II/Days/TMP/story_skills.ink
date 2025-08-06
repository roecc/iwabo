EXTERNAL SC( skill, modifier )
EXTERNAL ASC( skill, modifier )

-> ma_cooking

=== ma_cooking ===
I'm making two turkeys for dinner # ma
I'm going to use up tons of our food # ma
   ~temp s="foresight" 
   ~temp m=-10
 * We need that food for later # sc_{s}_{m}
   ~temp sc = SC(s, m)
   But it's Christmas.. # ma
   { sc:
   SUCCESS
   We can't afford to splurge
   You're right, I'll cook less # ma
    - else:
    FAIL
   We've lost so much. We can't also lose Christmas # ma
    }
    ->DONE
  ~temp am=15
 * That's nice # asc_{s}_{am}
 ~temp asc = ASC(s, am)
 { asc:
 SUCCESS
 I think so too # ma
 - else:
 FAIL
 I'm sorry Mary Ann but we can't justify cooking that much
 }
    ->DONE

->END
