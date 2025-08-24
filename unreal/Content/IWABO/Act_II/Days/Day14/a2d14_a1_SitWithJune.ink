INCLUDE ../globals.ink

*visit June at her sickbed
    **to take her temperature.
        Her small forehead squirms a little under your cool touch. 
        You're no doctor, but it doesn't feel much different from the other days.
        ->D14A1
    **before.. ->D14A1
    **(-1 Action Point) 
        ->D14_SittingByJune



=== D14_SittingByJune ===
There really isn't much to do but sit and 
*wait.
    //It's been a while since time felt tangible in any way, but now you truly feel it grinding to a screetching halt.
    //Time rudely reintroduces itself by coming to a screetching halt.
    It's been a while since time has felt real, but it seems silly to question its existance now that it has so rudely come to a screetching halt. 
    Deafening silence envelops you.
    **...
    --
    **...
    --
    There! June just turned her head a little!
    **...
        ***wait #sc_foresight_-20
            ->wait
        ***"Yup, I'm Bored."
            ->D14_PaperBalls
                        
    
*pray.
    You fold your hands and begin praying for your daughters swift recovery.
    Time flies in the presence of God.
    (Faith++)
    "Thank you, for covering my shift."
    ->D14_SittingByJune2

= D14_SittingByJune2
Mary-Ann looks at you
"Good morning."
Tired eyes, gentle smile.
(Mary-Ann mood++)
->D14A2

= wait
{ outcome:
    *...
        (Discipline++)
        After what feels like eons, 
        ->D14_SittingByJune2  
-else:
    (Discipline++)
    ->D14_PaperBalls
}

= D14_PaperBalls
You start ripping the corners of the nearby notebook, bunching them up between your fingers and flicking them towards Mary-Anns open mouth.
It's not an easy shot.
But you have time.
Inevitably, the law of large numbers holds:
*Bull's Eye!
    Mary-Ann chokes on and promptly spits out the little paper ball which joins the many, many others surrounding and completely covering her and the blanket of your bedridden daughter.
    She takes a sharp breath, but before she can say anything, June gives a sigh, pause and loses herself in laughter.
    (June Mood++)
    Mary-Ann gives you a stern look, and begins brushing the paper balls down, oblivious to the ones in her hair.
    ->D14A2

=== D14A1 ===
->END
//And Mary-Ann, now surrounded by and completely covered in little paper balls, 
=== D14A2 ===
->END