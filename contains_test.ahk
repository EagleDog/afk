;contains_test.ahk


; the_list := dog,cat

the_var := cat

the_list := dog . cat . bob

the_pos := InStr(the_var, the_list)

MsgBox, %the_pos%


; if the_var in dog,cat



