//perception: notice she's holding a note.
//surveillance: demand she give it to you.
//[let it go]: counter surveillance

LIST modFlags = (hit_april), (ate_dog), (burnt_books)
LIST counterState = counter_roll

=== tst_the_note ===
April is sitting at her desk when you come in.
//percept check
{roll_trait(perception, 40): <-noticed_note}
{roll_trait(nurturing, 20): <-ask_how_doing}
*   ->nothing_to_say
-->DONE

= nothing_to_say
*\[slip back out\]
        ->end_story

= ask_how_doing
* I noticed you're a bit down lately, is everything alright?
    Yea Dad, I'm okay.
    Thanks for asking though.
->DONE

= noticed_note
You notice she's quickly pocketed a small piece of paper the moment she heard the door.
-(options)
<- demand_note (->options)
<- demand_book
*demand nested note
*\[let it go\]
    //counter surveillance check
    {is_tox(perception): <-cr_let_it_go}
- ->DONE

//similar to tunnel?
= demand_note (-> go_on)
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
->trait_option("Give me the note.", authority, mod_val, mod_text, not counter_roll, ->pass, ->fail)
- (pass) //on success
    She lowers her head in defeat and hands you the crumpled piece of paper.
    ->go_on
    ->ERROR.loose_end
- (fail) //on fail
     She purses her lips defiantly, not moving another muscle.
	->ERROR.loose_end


= demand_book
~temp mod_val = 0
~temp mod_text = ""
- (mods)
{modFlags ? hit_april: {add_mod("hit april", 40, mod_text, mod_val)}}
{modFlags ? ate_dog: {add_mod("ate_the_dog", 10, mod_text, mod_val)}}
{modFlags ? burnt_books: {add_mod("burnt books", -10, mod_text, mod_val)}}

->trait_option("Give me the book.", authority, mod_val, mod_text, not counter_roll, ->pass, ->fail)
- (pass)
    She tosses you the book.
    ->end_story
- (fail)
    She sets the book on fire.
    ->end_story

= cr_let_it_go
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
But she's hiding something.
<-demand_note(->ERROR.loose_end)
<-demand_book
->trait_option("[let it go]", perception, mod_val, mod_text, counter_roll, ->pass, ->fail)
- (pass) //on success
    Taking a deep breath, you re-center yourself and let go.
    ->ERROR.loose_end
- (fail) //on fail
    I can't have her not trust me.
    ->noticed_note.options
	->ERROR.loose_end
