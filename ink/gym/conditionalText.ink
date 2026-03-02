=== conditional_text ===
{not study: Text can vary depending on logical tests, just as options can.}
{study: And yet }I understand nothing{not study:.| still.}
{study: These can appear as separate lines, or within a section of content. They can even be nested.}
+[study]
    ->study
+{study}[nested example]
    ->nested


=study
So I study hard.
->conditional_text

=nested
*meet the guy
    ->met_blofeld
+get result
    {met_blofeld: "I saw him. Only for a moment. His real name was {learned_his_name: Franz|kept a secret}." | "I missed him. Was he particularly evil?" }
    ++[done]
        ->INDEX


=met_blofeld
*learn his name
    ->learned_his_name
*ignore him
    ->nested

=learned_his_name
It's Franz.
->nested