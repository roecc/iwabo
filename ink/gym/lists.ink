LIST tempState = freezing, cold, chilly, lukewarm, hot, scolding
LIST onOffState = on, off

VAR kettleState = (off, cold) //multi-valued list, combining temp and onOff States.
VAR freezerState = (off, chilly)
VAR lampState = (on, hot)

=== lists ===
+kettle example
    ->kettle_example
+[done]
    ->INDEX

= kettle_example
You look at the kettle, standing there, {kettleState}.
+ Turn the kettle {kettleState ? on: off|on}.
    ~OnOffKettle()
+[wait]
    ->wait
+[leave]
    ->lists
- ->kettle_example

= wait
{
    -kettleState ? on && not (kettleState ? hot || kettleState ? scolding):
        You hear the water raging in the kettle, ever higher, ever hotter.
        ~kettleState -= kettleState ^ LIST_ALL(tempState)
        ~kettleState += scolding
    -kettleState ? off && (kettleState ? hot || kettleState ? scolding):
        Over time the raging water calms and stills.
        ~kettleState -= kettleState ^ LIST_ALL(tempState)
        ~kettleState += lukewarm
    -else:
        You wistle to yourself, unsure what you're waiting for.
}
->kettle_example

=== function OnOffKettle() ===
~SwitchOnOffState(kettleState)
{
    - (kettleState ? hot || kettleState ? scolding):
    {    
        - kettleState ? on:
            The switch immediately flicks itself back to the off position.
            ~SwitchOnOffState(kettleState)
        - else:
            The turbulant water inside calms.
            //~SwitchOnOffState(kettleState)
    }
    - kettleState ? on: 
        After a moment the rush of boiling water fills the room.
    - kettleState ? off:
        Snubbed of it's potential, the kettle settles back into fridgit silence.
}

=== function SwitchOnOffState(ref someState) ===
{
    -someState ? on:
        ~someState -= on
        ~someState += off
    -someState ? off:
        ~someState -= off
        ~someState += on
    -else:
        ERROR: no on/off state assigned.
}