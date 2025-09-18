INCLUDE ../globals.ink

->BunkerMaintenance

=== BunkerMaintenance ===
{ rf("fixedGenerator"):
->GeneratorFixed
- else:
->FixGenerator
}

= FixGenerator
The blinking lights intimidate you.
But you must keep this heart beating.
If you want those of your family to do the same.
* [\[maintenance\] #ua_1 #sc_tinkering_-70]
    ->MaintainCheck
* [\[leave\]]
    ->END

= GeneratorFixed
The generator hums reassuringly. You'll be able to grow enough food to survive the next month.
->END

= MaintainCheck
{ outcome:
    a brief glance at the toiling machine is enough to know one of the fans of the turbine has shook lose. The fix, though time consuming, won't be difficult. #sf_fixedGenerator
-else:
    one hand firmly clasped before your eyes in horror of the fun surprises your finger, aimlessly jabbing at the ever more furiously blinking lights, might visit upon your unsuspecting family. 
    After roaring up as if in protest, the machine soon returns to its familiar hum the moment you stop "fixing" it. #um_d_-10
}
->END