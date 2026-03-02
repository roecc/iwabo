//perception: notice she's holding a note.
//surveillance: demand she give it to you.
//[let it go]: counter surveillance

LIST modFlags = (hit_april), (ate_dog), (burnt_books)

=== tst_the_note ===
April is sitting at her desk when you come in.
//percept check
You notice she's quickly pocketed a small piece of paper the moment she heard the door.
//<- demand_note
<- demand_book
*\[let it go\]
    //counter surveillance check
->DONE

= demand_note
//*Give me the note. {disp_trait("authority")} ->check_trait("authority", 0, ->pass, ->fail)
- (pass)
    She lowers her head in defeat and hands you the crumpled piece of paper.
    ->end_story
- (fail)
    She purses her lips defiantly, not moving another muscle.
    ->end_story

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
    
//add the mod_text and value to the display string
=== function add_mod (text, val, ref sum_text, ref sum_val) ===
 ~sum_text += " {text}: {val>=0:+}{val};"
 ~sum_val += val
 
=== trait_option(option_text, trait_name, mod_val, mod_text, ->pass, ->fail) ===
//*\ {option_text} {disp_trait(trait_name)} 
*\ {option_text} {disp_trait(trait_name, mod_val, mod_text)} 
    ->check_trait(trait_name, mod_val, pass, fail)