//perception: notice she's holding a note.
//surveillance: demand she give it to you.
//[let it go]: counter surveillance

LIST modFlags = hit_april, (ate_dog), burnt_books

=== tst_the_note ===
April is sitting at her desk when you come in.
//percept check
You notice she's quickly pocketed a small piece of paper the moment she heard the door.
//<- demand_note
<- demand_book//.mods
*\[let it go\]
    //counter surveillance check
/*
*Give me the note. {disp_trait("authority")} ->check_trait("authority", 0, ->demand_note.pass, ->demand_note.fail)
    //~tmp_div = check_trait("authority", 0, ->demand_note.pass, ->demand_note.fail)
    //->tmp_div
    //auth check, surv bonus
*/
->DONE

= demand_note
//*Give me the note. {disp_trait("authority")} ->check_trait("authority", 0, ->pass, ->fail)
- (pass)
    She lowers her head in defeat and hands you the crumpled piece of paper.
    ->end_story
- (fail)
    She purses her lips defiantly, not moving another muscle.
    ->end_story

= demand_book //(mod_text, mod_val)
- (mods)
~temp _mod_val = 0
~temp _mod_text = ""
{modFlags ? hit_april:
        ~_mod_text += " hit april: +40;"
        ~_mod_val += 40
}
{modFlags ? ate_dog:
        ~_mod_text += " ate the dog: +10;"
        ~_mod_val += 10
}
{modFlags ? burnt_books:
        ~_mod_text += " burnt books: -10;"
        ~_mod_val -= 10
}
->trait_option("Give me the book.", "authority", _mod_val, _mod_text, ->pass, ->fail)
- (pass)
    She tosses you the book.
    ->end_story
- (fail)
    She sets the book on fire.
    ->end_story
//export into function
/*
~temp _mod_val = 0
~temp _mod_text = ""
{modFlags ? hit_april:
        ~_mod_text += " hit april: +40;"
        ~_mod_val += 40
}
{modFlags ? ate_dog:
        ~_mod_text += " ate the dog: +10;"
        ~_mod_val += 10
}
{modFlags ? burnt_books:
        ~_mod_text += " burnt books: -10;"
        ~_mod_val -= 10
}
*/
//->demand_book(_mod_text, _mod_val)

=== function add_mod (ref mod_text, ref mod_val) ===
mod

=== trait_option(option_text, trait_name, mod_val, mod_text, ->pass, ->fail) ===
//*\ {option_text} {disp_trait(trait_name)} 
*\ {option_text} {disp_trait(trait_name, mod_val, mod_text)} 
    ->check_trait(trait_name, mod_val, pass, fail)