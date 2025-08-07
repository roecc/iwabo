EXTERNAL SC( skill, modifier )
EXTERNAL ASC( skill, modifier )

-> ma_cooking

=== ma_cooking ===
M: I'm making two turkeys for dinner
M:I'm going to use up tons of our food
~temp s1="foresight"
~temp m1=-12
~temp s2="foresight"
~temp m2=16
~temp s3="authority"
~temp m3=30
// For some very weird reason putting variables into tags jumbles the order of the characters on the unreal side. Didn't look into it further, just using hardcoded things for now
 * We need that food for later #sc_foresight_-12
 ->ma_cooking_1(s1,m1)  
 * [That's nice # asc_foresight_16]
 ->ma_cooking_2(s2, m2)
 * YOU BETTER NOT # sc_authority
 ->ma_cooking_3(s3,m3)

=== ma_cooking_1(s, m) ===
~temp sc = SC(s, m)
   M: But it's Christmas..
   { sc:
   SUCCESS
   We can't afford to splurge
   M: You're right, I'll cook less
    - else:
   FAIL
   M: We've lost so much. We can't also lose Christmas
    }
    ->END
    
=== ma_cooking_2(s, m) ===
~temp sc = ASC(s, m)
 { sc:
 SUCCESS
 D: That's nice
 M: I think so too
 - else:
 FAIL
 I'm sorry Mary Ann but we can't justify cooking that much
 }
 ->END
 
=== ma_cooking_3(s, m) ===
 ~temp sc=SC(s,m)
->END
