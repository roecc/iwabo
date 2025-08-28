INCLUDE ../globals.ink

-> ma_cooking

=== ma_cooking ===
Mary Ann looks busy chopping veg
Daryl's foresight is toxic: {isTox("foresight")}
Daryl's foresight is: { foresight }
Mary ann's mood is: { moodM }
M: { moodM < 50:_muttering_ ...Every day sucks here|Mmm hmm what a lovely day}
M: { rf("armchairChef"):Can you not breath over my neck while I cook?|What's up? }
 * {perception >= 30 && not rf("armchairChef") } The steak looks overdone
    M: Hmmm yes it is a bit #us_perception_2 #sf_armchairChef
    ->END
 * Hello Mary Ann what are you cooking? #ua_1
    M: I'm making two turkeys for dinner
    M:I'm going to use up tons of our food
     ** We need that food for later #sc_foresight_-12 # um_m_-5
     ->ma_cooking_1
     ** [That's nice # asc_foresight_16]
     ->ma_cooking_2
     ** We're already out of food this month # sc_paranoia
     ->ma_cooking_3
     ** YOU BETTER NOT # sc_authority_30
     ->ma_cooking_4
 * Bye
-> END


=== ma_cooking_1 ===
   M: But it's Christmas.. # um_d_10
   Mary ann new mood: { moodM }
   Daryl new foresight: { foresight }
   { outcome:
   SUCCESS
   D: We can't afford to splurge
   M: You're right, I'll cook less 
    - else:
   FAIL
   M: We've lost so much. We can't also lose Christmas
    }
    ->END
    
=== ma_cooking_2 ===
 { outcome:
 SUCCESS
 D: That's nice
 M: I think so too
 - else:
 FAIL
 D: I'm sorry Mary Ann but we can't justify cooking that much
 }
 ->END
 
=== ma_cooking_3 ===
 { outcome:
 SUCCESS
 M: Really?? How so fast?
 D: We've been eating too much!
 - else:
 FAIL
 M: That's not true! I checked inventory yesterday
 }
 ->END
 
 
=== ma_cooking_4 ===
->END
