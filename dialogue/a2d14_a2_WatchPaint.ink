
=== a2d14_a2_a_WatchPaint ===
April is hunched over a painting.
She doesn't seem to see you.
*[I need you to fix the generator]
->ConvinceApril
*[\[Watch her work\] #ua_1]
    #us_creativity_1
    You watch for a while as her brush dances across the paper.
    April throws you an almost imperceptible smile as she notices your gaze. #um_a_20
    ->DONE
+ [\[Leave her be\]]
    ->DONE

= ConvinceApril
A: Oh. Sorry Dad, I can't. I'm working on something.
D: Can it wait? The generator is urgent.
A: I know, but I'm busy with this right now.
*[Tell me about it? Maybe I can help #ua_1]
    ->TalkItThrough
*[April, you're fixing the generator. Now. #sc_authority #scm_It is April's job_30]
    ->ForceApril

= TalkItThrough
A: It's this painting...
*[Why's it so important?]
A: It's for June. She really needs some cheering up.
A: She always begs me to draw all kinds of dumb stuff. Like Oturan, and horses...
A: But it helps her get better, so I need to do it.
    **[Why can't you do it later?]
->DONE
*[What's it a painting of?]
->DONE

= ForceApril
{ outcome:
A: O-Okay, okay. I'll do it. Just give me 5 minutes.
A: But I'll do it.
- else:
A: Why should I do it right now? It's been broken for days!
A: I'll do it when I can. I told you I'm busy right now.
}
->DONE