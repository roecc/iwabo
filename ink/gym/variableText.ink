=== variable_text ===
//this doenst work
//{not intro} ->intro
->index

= intro
So far, all the content we've seen has been static, fixed pieces of text. But content can also vary at the moment of being printed.
Sequences, cycles and other alternatives
The simplest variations of text are provided by alternatives, which are selected from depending on some kind of rule. ink supports several types. Alternatives are written inside \{...\} curly brackets, with elements separated by \| symbols (vertical divider lines).
These are only useful if a piece of content is visited more than once!
->variable_text

= index
+intro
    ->intro
+sequences
    <>: the default
    A sequence (or a "stopping block") is a set of alternatives that tracks how many times its been seen, and each time, shows the next element along. When it runs out of new content it continues the show the final element.
    Notably they progress even if the label (count) isn't increased. When the knot diverts to itself for example. The count stays the same but the sequence continues!
    ->sequences
+cycles
    Cycles are like sequences, but they loop their content.
    ->cycles
+once-only
    <> (marked with a !)
    Once-only alternatives are like sequences, but when they run out of new content to display, they display nothing. (You can think of a once-only alternative as a sequence with a blank last entry.)
    ->once
+shuffles
    Shuffles produce randomised output.
    ->shuffles
+features of alternatives
    ->features
+[done]
    ->INDEX

= sequences
+[example]
    ->sequence_example
+[done]
    ->variable_text

= sequence_example
Example Sequence [{sequence_example}]:
The radio hissed into life. {"Three!"|"Two!"|"One!"|There was the white noise racket of an explosion.|But it was just static.}

{I bought a coffee with my five-pound note.|I bought a second coffee for my friend.|I didn't have enough money to buy any more coffee.}
->sequences

= cycles
It was {&Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday} today.
+[div to self]
    ->cycles
+[return]
    ->index

= once
{He told me a joke.|He told me the same Joke.|And told it again.|And again.|He kept telling the same Joke.} {!I laughed politely.|I smiled.|I grimaced.|I promised myself to not react again.}
+[div to self]
    ->once
+[return]
    ->index

= shuffles
I tossed the coin. {~Heads|Tails}.
+toss again
    ->shuffles
+[return]
    ->index


= features
+blank elements
    Alternatives can contain blank elements.
    ->blank
+nested
    Alternatives can be nested.
    ->nested
+in choices
    Alternatives can be used in choices.
    ->choices1
+multiline alternatives
    ink has another format for making alternatives of varying content blocks, too. See the section on multiline blocks for details.
    ->features
+whack-a-demo
    ->whack_a_mole
+[return]
    ->index


=blank
I took a step forward. {||||Then the lights went out.|->diverts}
+[again]->blank

=diverts
Alternatives can divert.
->features

=nested
//\The Ratbear \{\&\{wastes no time and \|\}swipes|scratches\} \{\&at you\|into your \{\&leg\|arm\|cheek\}\}.
The Ratbear {&{wastes no time and |}swipes|scratches} {&at you|into your {&leg|arm|cheek}}.
+again
    ->nested
+[return]
    ->features

=choices1
+ 	"Hello, {&Master|Monsieur Fogg|you|brown-eyes|dick-nose}!"[] I declared.
    Now the same option has an alt text.
    Interestingly, the alternatives seem to rotate even on choice selection, which really isn't ideal.
    //It's not even dependent on the []?
    ->choices1
+caveats[]:
    (...you can't start an option's text with a \{, as it'll look like a conditional.)
    ++[...]
        (...but the caveat has a caveat, if you escape a whitespace \ before your \{ ink will recognise it as text.)
        ->choices2
    ->index

=choices2
+\	{&They headed towards the Sandlands|They set off for the desert|The party followed the old road South}
    ->choices2
+[return]
    ->features

=whack_a_mole 
{I heft the hammer.|{~Missed!|Nothing!|No good. Where is he?|Ah-ha! Got him! -> end}}
	The {&mole|{&nasty|blasted|foul} {&creature|rodent}} is {in here somewhere|hiding somewhere|still at large|laughing at me|still unwhacked|doomed}. <>
	{!I'll show him!|But this time he won't escape!}
	* 	[{&Hit|Smash|Try} top-left] 	-> whack_a_mole
	*  [{&Whallop|Splat|Whack} top-right] -> whack_a_mole
	*  [{&Blast|Hammer} middle] -> whack_a_mole
	*  [{&Clobber|Bosh} bottom-left] 	-> whack_a_mole
	*  [{&Nail|Thump} bottom-right] 	-> whack_a_mole
	*   ->
    	    Then you collapse from hunger. The mole has defeated you!
    	    ->end

=end
THE END
->features








