=== a2d14_a4_a_InRoom ===
*\[knock\]
*\[listen\] #sc_perception_0
    ->Listening
*{skill(perception) > 60} \[enter her room\]
    A: What are you doing in here?
    A: Get out!
*\[leave\]
    ->LEAVE
-
->END

= Listening
{outcome:
    You hear a fain sobbing from inside.
-else:
    You can't hear anything.
}
->a2d14_a4_a_InRoom