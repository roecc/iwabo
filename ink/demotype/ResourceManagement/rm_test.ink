VAR day = 0
VAR action_points = 0
VAR ap_text = "\[-1 AP\] "

=== next_day ===
~day++
~action_points = 5
DAY {day}:
->main_day

=== function tick_ap () ===
~temp debug = 1
~action_points--
{debug:\[ap: {action_points}]}

=== ap(option_text) ===
+\ \[-1 ap\] {option_text}
    ~tick_ap()
    ->->

=== function ap_cond() ===
~return "\[-1 AP\]"

=== main_day ===
ap: {action_points}
{action_points < 1: ->next_day}
<-generator
<-farm
<-sleep
->DONE

=== generator ===
+\ {ap_text} check on generator
    ++fix generator
        all good.
        ->main_day

=== farm ===
<-check
<-tv
->DONE

= check
->ap("check on the farm")->
//+\ {ap_text}check on the farm
    all good.
    ->main_day

= tv
->ap("watch tv")->
    ->main_day

=== sleep ===
+[go to bed]
    you go to bed
    ->next_day