EXTERNAL RollSkill( skill, modifier )

-> ma_cooking

=== ma_cooking ===
I'm making two turkeys for dinner # ma
I'm going to use up tons of our food # ma
   ~temp skill="foresight" 
   ~temp mod=-10
 * We need that food for later # sc_{skill}_{mod}
   ~temp success = RollSkill(skill, mod)
   But it's Christmas.. # ma
   { success:
   We can't afford to splurge
   You're right, I'll cook less # ma
    - else:
   We've lost so much. We can't also lose Christmas # ma
    }
 * That's nice

- They lived happily ever after.
    -> END
