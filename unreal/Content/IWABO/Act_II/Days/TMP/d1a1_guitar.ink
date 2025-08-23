INCLUDE ../globals.ink

-> april_guitar

=== april_guitar ===
A: _Playing_
{ skill("reflection") >= 30:
 * _Quietly listen_ #ua_1
    A: _Continues playing for a bit_
    ** Sounds great
    A: Thanks Dad
    ->END
    ** Sloppy
    A: :0 #um_a_-20
    ->END
}
 * Sounds great!
 { mood("a") < 50:
    A: You interrupted me!
 - else:
    A: Thanks, but I'm in the middle of playing
 }
    ->END
 * _Leave_
    ->END
