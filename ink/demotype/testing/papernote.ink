//perception: notice she's holding a note.
//surveillance: demand she give it to you.
//[let it go]: counter surveillance

LIST modFlags = (hit_april), (ate_dog), (burnt_books)

=== tst_the_note ===
April is sitting at her desk when you come in.
//percept check
You notice she's quickly pocketed a small piece of paper the moment she heard the door.
* engage her
    some nested text.
    <- demand_note
    <- demand_book
*\[let it go\]
    //counter surveillance check
-->DONE

= demand_note
~temp mod_val = 0
~temp mod_text = ""
- (mods) //add trait-check modifiers

- (option)
->trait_option("Give me the note.", "authority", mod_val, mod_text, ->pass, ->fail)
- (pass) //on success
    She lowers her head in defeat and hands you the crumpled piece of paper.
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

->trait_option("Give me the book.", "authority", mod_val, mod_text, ->pass, ->fail)
- (pass)
    She tosses you the book.
    ->end_story
- (fail)
    She sets the book on fire.
    ->end_story
