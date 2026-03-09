// VAR day = 0
// VAR ap_text = "\[-1 AP\] "

// === next_day ===
// ~day++
// ~action_points = 5
// DAY {day}:
// ->main_day



// // === ap(option_text) ===
// // //+\ \[-1 ap\] {option_text}
// // +\ {ap_option(option_text, -1)}
// //     ~ap_update(-1)
// //     ->->

// // === function ap_cond() ===
// // ~return "\[-1 AP\]"

// === main_day ===
// ap: {action_points}
// {action_points < 1: ->next_day}
// <-generator
// <-farm
// <-sleep
// ->DONE

// === generator ===
// +\ {ap_option("check on generator", -1)}
// 	~ap_update(-1)
//     all good.
//     ->main_day
// +\ {ap_option("generator maintenance", -1)}
// 	~ap_update(-1)
// 	{trait_roll(tinkering, 20):generator improved|didnt seem to help}
// 	->main_day

// === farm ===
// <-check
// <-tv
// ->DONE

// = check
// +\ {ap_option("check on farm", -1)}
// //->ap("check on the farm")->
// //+\ {ap_text}check on the farm
// all good.
// ->main_day

// = tv
// //->ap("watch tv")->
// +\ {ap_option("check on tv", -1)}
//     nothing good on. will watch anyway.
//     ->main_day
// +\ {ap_option("zap channels", -1)}
//     all dead
//     ->main_day

// === sleep ===
// +[go to bed]
//     you go to bed
//     ->next_day