EXTERNAL SC( skill, modifier )
EXTERNAL ASC( skill, modifier )

-> ma_cooking

=== ma_cooking ===
I'm making two turkeys for dinner # ma
I'm going to use up tons of our food # ma
~temp s1="foresight"
~temp m1=-12
~temp s2="foresight"
~temp m2=16
~temp s3="authority"
~temp m3=30
 * We need that food for later #sc_foresight_-12
 ->ma_cooking_1(s1,m1)  
 * That's nice # asc_foresight_16
 ->ma_cooking_2(s2, m2)
 * YOU BETTER NOT # sc_authority_30
 ->ma_cooking_3(s3,m3)

=== ma_cooking_1(s, m) ===
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
    ->END
    
=== ma_cooking_2(s, m) ===
~temp sc = ASC(s, m)
 { sc:
 SUCCESS
 I think so too # ma
 - else:
 FAIL
 I'm sorry Mary Ann but we can't justify cooking that much
 }
 ->END
 
=== ma_cooking_3(s, m) ===
 ~temp sc=SC(s,m)
->END
