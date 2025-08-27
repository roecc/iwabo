INCLUDE ../globals.ink

-> april_guitar

=== april_guitar ===
A: _Playing_
My foresight is toxic: {isTox("foresight")}
 * {skill("reflection") >= 30} _Quietly listen_ #ua_1
    A: _Continues playing for a bit_
    ** Sounds great #sf_listenedApril
    A: Thanks Dad #us_reflection_2
    ->END
    ** Sloppy
    A: :0 #um_a_-20
    ->END
 * { rf("listenedApril") } Sounds great!
    A: { mood("a") < 50: You interrupted me!| Thanks, but I'm in the middle of playing}
    ->END
 * _Leave_
    ->END
