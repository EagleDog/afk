;afs.ahk

;ExitApp
Pause On



;____________________________________________________________________

;                                    							 OPTIONS
RCB := reconnect_button
PLB := play_button
champion_spots := [champion_spot_1, champion_spot_2, champion_spot_3, champion_spot_4]

repetitions := 7200 ;6800 ;2000 ;6800 ;5400 ;5400=45min ;7200=1hr ;6000=50min ;3600=30min ~2 per second ~120 per minute
scroll_amount := 25
scroll_click_go := 0

training_go := 1
walking_go := 0        ; _________________________________
vote_go := 1
siege := 0             ; MAIN OPTIONS    <<==_____________
reconnect_go := 1

which_training  := 3   ;(0=Z 1=A, 2=Chakra, 3=D, 4=1v1, 5=G)

weapon          := 4   ;(1,2,3,4)
pre_weapon      := 1

destruction := 1       ; _________________________________
which_champion := 3 
deploy_super := 1      ;                           OPTIONS

;____________________________________________________________________


screen_mode := "big"  ;"big" "both" "small" "very_small"

;____________________________________________________________________

if (screen_mode = "very_small") {			      ; ---- screen_mode "small" ----
	reconnect_button := [1000, 600]
	play_button := [1000, 800]

	vote_click := [710, 422]  ;[710, 422] jugg  ;[570, 422] ffa
	train_click_boss := [625, 480]
	train_click_jugg := [625, 270]
	train_click_ffa := [625, 250]
	train_click := [1000, 620] ;[1100, 450] ;[625, 250]

	player_spot := [80, 590] ;80, 590
	champion_spot_0 := [250, 550]
	champion_spot_1 := [600, 570] ;tatashi
	champion_spot_2 := [850, 570] ;zenitsu
	champion_spot_3 := [1050, 570] ;marco
	champion_spot_4 := [1250, 570] ;pebble lee
	champion_summon := [1600, 630]
}
else if (screen_mode = "small") {											              ; ---- screen_mode "big" ----
	vote_click := [760, 445]
	train_click_boss := [690, 570]
	train_click_jugg := [690, 300]
	train_click_ffa := [625, 250]
	train_click_1v1 := [690, 460]
	train_click := [840, 470] ;[1100, 450] ;[625, 250]

	player_spot := [50, 425] ;80, 590
	champion_spot_0 := [200, 400]
	champion_spot_1 := [480, 410] ;tatashi
	champion_spot_2 := [620, 410] ;zenitsu
	champion_spot_3 := [760, 410] ;marco
	champion_spot_4 := [900, 410] ;pebble lee
	champion_summon := [1100, 455]

	reconnect_button := [840, 470]
	play_button := [570, 560]
} else if (screen_mode = "both") {    ; ---- screen_mode "both" ----
	reconnect_button := [1000, 600]
	play_button := [1000, 800]

	vote_click := [710, 422]  ;[710, 422] jugg  ;[570, 422] ffa
	train_click_boss := [625, 480]
	train_click_jugg := [625, 270]
	train_click_ffa := [625, 250]
	train_click := [1000, 620] ;[1100, 450] ;[625, 250]

	player_spot := [80, 590] ;80, 590
	champion_spot_0 := [250, 550]
	champion_spot_1 := [600, 570] ;tatashi
	champion_spot_2 := [850, 570] ;zenitsu
	champion_spot_3 := [1050, 570] ;marco
	champion_spot_4 := [1250, 570] ;pebble lee
	champion_summon := [10, 10]
} else {									;screen_mode "big"		              ; ---- screen_mode "big" ----
	vote_click := [760, 445]
	train_click_boss := [690, 570]
	train_click_jugg := [690, 300]
	train_click_ffa := [625, 250]
	train_click_1v1 := [690, 460]
	train_click := [840, 470] ;[1100, 450] ;[625, 250]

	player_spot := [50, 425] ;80, 590
	champion_spot_0 := [200, 400]
	champion_spot_1 := [480, 410] ;tatashi
	champion_spot_2 := [620, 410] ;zenitsu
	champion_spot_3 := [760, 410] ;marco
	champion_spot_4 := [900, 410] ;pebble lee
	champion_summon := [1100, 455]

	reconnect_button := [840, 470]
	play_button := [570, 560]
}

champion_spots := [champion_spot_1, champion_spot_2, champion_spot_3, champion_spot_4]

;____________________________________________________________________

If (which_training = 1) {
	repetitions := 3000 ;10000 ;2000 ;6800
} Else If (which_training = 2) {
	repetitions := 2800
} Else {
	repetitions := 300 ;600
}

If (vote_go = 0) {
	vote_click := train_click
}
If (which_training = 3) {
	train_click := train_click_jugg
} 
If (which_training = 4) {
	train_click := train_click_1v1
}

;____________________________________________________________________

;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================

While 1 = 1 {                                  ; ==============   MAIN LOOP

	If (training_go = 1) {
		Sleep, 100

		ActivateRoblox()
		Sleep, 200

		If (reconnect_go = 1) {

			ClickReconnectButton(RCB[1], RCB[2])
			Sleep, 500

			ClickPlayButton(PLB[1], PLB[2])
			Sleep, 500
		}

		GetWeapon(pre_weapon, weapon)
		Sleep, 300

		If (walking_go = 1) {
			TrainingC()
			Sleep, 100
		}
		If (which_training = 1) {
			TrainingA()	
		} Else If (which_training = 2) {
			TrainingChakra()
		} Else if (which_training = 3) {
			TrainingD()
		} Else if (which_training = 5) {
			TrainingG()
		} Else {
			TrainingOneVOne()
		}
		Sleep, 200
	}
}


; ======= END MAIN LOOP ==========
;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================

;____________________________________________________________________
;
;          FUNCTIONS
;____________________________________________________________________

ActivateRoblox() {			;------------- ActivateRoblox()
;	#IfWinExist Roblox
	Sleep, 200
	If not (WinActive("Roblox"))  {
		Sleep, 200
		WinActivate, Roblox
		WinWaitActive, Roblox
	}
	Sleep, 200
}

ClickReconnectButton(RCB_x, RCB_y) { ;---- ClickReconnectButton()
	Sleep, 100
	MouseMove, RCB_x, RCB_y
	Sleep, 100
	Click, RCB_x, RCB_y
	Sleep, 200
}
ClickPlayButton(PLB_x, PLB_y) {      ;---- ClickPlayButton()
	Sleep, 100
	MouseMove, PLB_x, PLB_y
	Sleep, 100
	Click, PLB_x, PLB_y
	Sleep, 100
}


;==============================================================
;==============================================================
;==============================================================
;____________________________________________________________________

GetSword(weapon) {                    ; GET SWORD
	Sleep, 200
	Send, % weapon
	Sleep, 200
}
;
GetWeapon(pre_weapon, weapon) {       ; GET WEAPON
	Sleep, 200
	Send, % pre_weapon
	Sleep, 1000
	Send, % weapon
	Sleep, 200
}

AttackPrep() {                        ; ATTACK PREP
	global pre_weapon
	global weapon
	Sleep, 100
;	send, c
	Sleep, 100
	GetSword(pre_weapon) ;GetSword(1)
	Sleep, 200
	Send, 5
	SimpleClick()
	Send, m
	Sleep, 100
;	Send, n
	Sleep, 100
	GetChampion()
	Sleep, 100
	SimpleClick()
	Send, 7
	SimpleClick()
	Send, 5
	SimpleClick()
	Send, m
	GetSword(weapon) ;GetSword(4)
	Sleep, 100
	Send, 7
	Sleep, 200
;	Send, c
	Sleep, 100
}

;-------------------------
ChooseChampion() {                   ; CHOOSE CHAMPION
	global which_champion
	global champion_spots

	Sleep, 50
	If (which_champion = 1) {
		Sleep, 50
		MouseMove, champion_spots[1][1], champion_spots[1][2] ;550, 390
		Sleep, 50
		Click, champion_spots[1][1], champion_spots[1][2] ;550, 390      ;Itachu
		which_champion := 2
	} Else If (which_champion = 2) {
		Sleep, 50
		MouseMove, champion_spots[2][1], champion_spots[2][2] ;850, 390
		Sleep, 50
		Click, champion_spots[2][1], champion_spots[2][2] ;850, 390      ;Pebble Lee
		which_champion := 3
	} Else If (which_champion = 3) {
		Sleep, 50
		MouseMove, champion_spots[3][1], champion_spots[3][2] ;850, 390
		Sleep, 50
		Click, champion_spots[3][1], champion_spots[3][2] ;850, 390      ;Marco
		which_champion := 4
	} Else {
		Sleep, 50
		MouseMove, champion_spots[4][1], champion_spots[4][2] ;700, 390
		Sleep, 50
		Click, champion_spots[4][1], champion_spots[4][2] ;700, 390      ;Zenitso
		which_champion := 3
	}
	Sleep, 50
}
;------------------
GetChampion() {                     ; GET CHAMPION
	global train_click
	global player_spot
	global champion_spot_0
	global champion_summon

	Sleep, 50

	MouseMove, player_spot[1], player_spot[2] ;50, 400 ;Player
	Sleep, 50
	Click, player_spot[1], player_spot[2] ;50, 400
	Sleep, 300

	MouseMove, champion_spot_0[1], champion_spot_0[2] ;220, 380 ;Champions
	Sleep, 50
	Click, champion_spot_0[1], champion_spot_0[2] ;220, 380
	Sleep, 300

	ChooseChampion()
	Sleep, 300

	MouseMove, champion_summon[1], champion_summon[2] ;1600, 630 ;1030, 425 ;Summon
	Sleep, 50
	Click, champion_summon[1], champion_summon[2] ;1600, 630 ;1030, 425
	Sleep, 300

	MouseMove, player_spot[1], player_spot[2] ;50, 400 ;Player
	Sleep, 50
	Click,  player_spot[1], player_spot[2] ;50, 400
	Sleep, 300

	MouseMove, train_click[1], train_click[2]
}
;-----------------------
GetMarco() {										; GET MARCO
	global which_champion
	which_champion := 3
	GetChampion()
}
;------------------------
NeedSummon() {
	return 1
}

;____________________________________________________________________

;==============================================================
;==============================================================
;==============================================================
;____________________________________________________________________

TrainingA() {						;---------------- TRAINING A
	global repetitions
	counter := 0
	While counter < repetitions { 
		counter := counter + 1
		SimpleClick()
	}
}


TrainingB() {						;---------------- TRAINING B
	While 1 = 1 {
		Sleep, 10
		Send, {d Down}
		Sleep, 100
		Send, {Space Down}
		Sleep, 500
		Send, {Space Up}
		Sleep, 500
;		Click, 250, 150
		Send, {d Up}
		Sleep, 10
		Sleep, 10
		Send, {a Down}
		Sleep, 100
		Send, {Space Down}
		Sleep, 500
		Send, {Space Up}
		Sleep, 500
;		Click, 250, 150
		Send, {a Up}
		Sleep, 10

	}
}
TrainingC() {						;---------------- TRAINING C
	Sleep, 50
	Send, {w Down}
	Sleep, 50
}

TrainingChakra() {				;------------------ TRAINING CHAKRA
	global repetitions
	counter := 0
	While counter < repetitions {  ; ~30 per minute
		counter := counter + 1
		Sleep, 5
		Send, 3  ;Click, 700, 630
		Sleep, 795
		Send, 3  ;Click, 700, 630
		Sleep, 790
	}
}

TrainingD() { ;                   <______ TRAINING D _____>
	global destruction
	global vote_click
	global RCB
	global PLB
	Sleep, 100
	destruction := 1
	destruction_count := 0
	Sleep, 100
	While destruction_count < 20 {
		destruction_count := destruction_count + 1

		ClickReconnectButton(RCB[1], RCB[2])
		Sleep, 5000

		Sleep, 100
		MouseMove, vote_click[1], vote_click[2]
		Click, vote_click[1], vote_click[2]
		Sleep, 50
		MouseMove, train_click[1], train_click[2]
		Sleep, 50
		AttackPrep()
		Sleep, 200

		ClickPlayButton(PLB[1], PLB[2])
		Sleep, 5000

		mighty_counter := 0
		While mighty_counter < 5 And destruction = 1 {
			mighty_counter := mighty_counter + 1
;			AttackFFA()
;			BackAndForth()
;			SmallAttack1()
			Sleep, 200
			MouseMove, vote_click[1], vote_click[2]
			Click, vote_click[1], vote_click[2]
			Sleep, 100
;			MightyAttack2()
			Sleep, 100
			SwordPractice()
			Sleep, 100
			MouseMove, vote_click[1], vote_click[2]
			Click, vote_click[1], vote_click[2]
			Sleep, 100
			SwordPractice()
			Sleep, 100
			MouseMove, vote_click[1], vote_click[2]
			Click, vote_click[1], vote_click[2]
			Sleep, 100
		}
		Sleep, 500
	}
}
;----------------------------------

;--------------------------------------------------   SIMPLE CLICK
SimpleClick(times=2) {  ; ~120 cycles per minute
	global train_click
	clicks = 0
	while clicks < times {
		clicks = clicks +1
		Sleep, 40
		MouseMove, train_click[1], train_click[2]
		Click, train_click[1], train_click[2]
		Sleep, 104
		MouseMove, train_click[1], train_click[2]
		Click, train_click[1], train_click[2]
		Sleep, 87
	}
}

SwordPractice() {                   ; SWORD PRACTICE ;
	global vote_click                                ;
	global train_click                               ;
	Sleep, 100                                       ;
	MouseMove, vote_click[1], vote_click[2]          ;
	Click, vote_click[1], vote_click[2]
	Sleep, 50
	MouseMove, train_click[1], train_click[2]
	Sleep, 50
	AttackPrep()
	Sleep, 100
	train_sword := 0
	While train_sword < 30 {
		train_sword := train_sword + 1
		;Send, n
		Sleep, 5
		MouseMove, train_click[1], train_click[2]
		Click, train_click[1], train_click[2]
		Sleep, 202
		;Send, cccccc
		MouseMove, train_click[1], train_click[2]
		Click, train_click[1], train_click[2]
		Sleep, 197
	}
}
StopDestruction() {
	global destruction
	Sleep, 100
	destruction := 0
	Sleep, 100
}



;------------------------	    ;======
										;======
TrainingG() {			 		;---------------- TRAINING G
	global vote_click					;======
	While 1 = 1 {
		Sleep, 100
		MouseMove, vote_click[1], vote_click[2]
		Click, vote_click[1], vote_click[2]
		Sleep, 50
		AttackPrep()
		SimpleClick(1)
		AttackFFA()
		SimpleClick(1)
;		BackAndForth()
		SimpleClick(1)
		SmallAttack1()
		SimpleClick(1)
		MightyAttack1()
		SimpleClick(4)
		Sleep, 100
		SwordPractice()
		Sleep, 5
		Send, 3  ;Click, 700, 630
		Sleep, 795

		SimpleClick(1)

		Sleep, 100
		DeploySuperAttack()
		Sleep, 100
		SmallAttack1()
		Sleep, 100
		SimpleClick()
		SimpleClick()
		Sleep, 100
		DeploySuperAttack()
		Sleep, 100
		SmallAttack2()
		Sleep, 100
		SimpleClick()
		GetChampion()
		MightyAttack2()
		MightyAttack1()

	}							   ;======
}          ;====================== ;======
								   ;======
;--------------------------------- ;======


;----------------------------------
TrainingE() {
	global destruction
	destruction := 1
	Sleep, 100
	mighty_counter := 0
	While mighty_counter < 10 And destruction = 1 {
		mighty_counter := mighty_counter + 1
		MightyAttack1()
		Sleep, 1000
	}
}
;----------------------------------
TrainingOneVOne(){
	Sleep, 50
	Click, train_click[1], train_click[2]
	Sleep, 100
	AttackPrep()
	Sleep, 200
	counter := 1
	While counter < 10 {
		counter := counter + 1
		Sleep, 100
		DeploySuperAttack()
		Sleep, 100
		SmallAttack1()
		Sleep, 100
		SimpleClick()
		SimpleClick()
		Sleep, 100
		DeploySuperAttack()
		Sleep, 100
		SmallAttack2()
		Sleep, 100
		SimpleClick()
		SimpleClick()
		Sleep, 100
	}
}

;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================




;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================
;==============================================================
;----------------------------------
DoubleJump() {
	Sleep, 50
	Send, {Space Down}
	Sleep, 50
	Send, {Space Up}
	Sleep, 50
	Send, {Space Down}
	Sleep, 50
	Send, {Space Up}
	Sleep, 1
}
;----------------------------------
QuadJump() {
	Sleep, 100
	DoubleJump()
	Sleep, 300
	DoubleJump()
	Sleep, 100
}
;----------------------------------
SmallAttack1() {			; SMALL ATTACK
	global train_click
	Sleep, 50
	MouseMove, train_click[1], train_click[2]
	Sleep, 50
	DoubleJump()
	Send, e
	Sleep, 500
	DoubleJump()
	Send, q
	Sleep, 500
	DoubleJump()
	Send, h
	Sleep, 500
	DoubleJump()
	Send, r
	Sleep, 500
	DoubleJump()
	Send, n
	Sleep, 500
	DoubleJump()
	Send, t
	Sleep, 500
	DoubleJump()
	Send, g
	Sleep, 500
	DoubleJump()
	Send, y
	Sleep, 500
	DoubleJump()
	Send, u
	Sleep, 500
}

SmallAttack2() {
	global train_click
	Sleep, 50
	MouseMove, train_click[1], train_click[2]
	Sleep, 50
	DoubleJump()
	Send, b
	Sleep, 500
	DoubleJump()
	Send, c
	Sleep, 500
	DoubleJump()
	Send, p
	Sleep, 500
	DoubleJump()
	Send, f
	Sleep, 300
	DoubleJump()
	Send, g
	Sleep, 300
	DoubleJump()
	Send, h
	Sleep, 300
	DoubleJump()
	Send, c
	Sleep, 300
	DoubleJump()
	Send, k
	Sleep, 300
	DoubleJump()
	Send, v
	Sleep, 300
	DoubleJump()
	Send, b
	Sleep, 300
	DoubleJump()
	Send, u
	Sleep, 50
}
;----------------------------------
BackAndForth() {
	Sleep, 50
	Send, {a Down}
	Sleep, 100
	Send, {a Up}
	Sleep, 500
	Send, {w Down}
	Sleep, 100
	Send, {w Up}
	Sleep, 500
	DoubleJump()
	Sleep, 500
	Send, {d Down}
	Sleep, 100
	Send, {d Up}
	Sleep, 500
	Send, {s Down}
	Sleep, 100
	Send, {s Up}
	Sleep, 500
}
;----------------------------------
MightyAttack2() {
	global train_click
	Sleep, 50
	MouseMove, train_click[1], train_click[2]
	Sleep, 50
	Send, n
	Sleep, 1000
;	Send, e
;	Sleep, 700
	Send, c
	Sleep, 1000
	Send, f
	Sleep, 1000
	Send, g
	Sleep, 1500
	Send, {a Down}
	Sleep, 300
	Send, {a Up}
	Sleep, 100
	Send, {w Down}
	Sleep, 500
	DoubleJump()
	Sleep, 1000
	Send, {w Up}
	Sleep, 200
;	Send, {l Down}
;	Sleep, 50
;	Send, {l Up}
;	Sleep, 100
	Send, {d Down}
	Sleep, 100
	Send, {d Up}
	Sleep, 100
	Send, {s Down}
	Sleep, 50
	Send, {s Up}
	Sleep, 100
	Send, y
	Sleep, 700
	Send, f
	Send, {Left Down}
	Sleep, 400
	Send, {Left Up}
	Sleep, 200
	SimpleClick()
	SimpleClick()
}
;---------------------------
MightyAttack1() { ;                 <_______ MIGHTY ATTACK 1 _______>
	global train_click_1v1
	Sleep, 50
	MouseMove, train_click_1v1[1], train_click_1v1[2]
;	Click, train_click[1], train_click[2] ;275, 190
	DoubleJump()
	Send, e
	Sleep, 500
	DoubleJump()
	Send, c
	Sleep, 500
	DoubleJump()
	Send, q
	Sleep, 500
	DoubleJump()
	Send, g
	Sleep, 500
	DoubleJump()
	Send, h
	Sleep, 500
	DoubleJump()
	Send, r
	Sleep, 500
	DoubleJump()
	Send, t
	Sleep, 500
	DoubleJump()
	Send, y
	Sleep, 500
	DoubleJump()
	Send, u
	Sleep, 500
	DoubleJump()
	Send, b
	Sleep, 500
	DoubleJump()
	Send, c
	Sleep, 500
	DoubleJump()
	Send, p
	Sleep, 500
	DoubleJump()
	Send, f
	Sleep, 300
	DoubleJump()
	Send, g
	Sleep, 300
	DoubleJump()
	Send, h
	Sleep, 300
	DoubleJump()
	Send, c
	Sleep, 300
	DoubleJump()
	Send, k
	Sleep, 300
	DoubleJump()
	Send, v
	Sleep, 300
	DoubleJump()
	Send, b
	Sleep, 300
	DoubleJump()
	Send, u
	Sleep, 50
}
;----------------------------------
DeploySuperAttack() {
	global deploy_super
	If (deploy_super = 1) {
		deploy_super := 2
		Sleep, 100
		SuperAttack()
		Sleep, 100
	} Else {
		deploy_super := 1
		Sleep, 100
		ReequipSuperAttack()
		Sleep, 100
	}

}
SuperAttack() {
	Sleep, 100
	Send, {c Down}
	Sleep, 50
	Send, {c Up}
	Sleep, 300
	Send, {5 Down}
	Sleep, 50
	Send, {5 Up}
	Sleep, 100
	Send, {6 Down}
	Sleep, 50
	Send, {6 Up}
	Sleep, 50
}
ReequipSuperAttack() {
	Sleep, 100
	Send, {6 Down}
	Sleep, 50
	Send, {6 Up}
	Sleep, 100
	Send, {5 Down}
	Sleep, 50
	Send, {5 Up}
	Sleep, 50
}

;----------------------------------
;----------------------------------
ScrollClick(amount) {
	global scroll_click_go
	scroll_click_go := 1
	While scroll_click_go = 1 {
		Sleep, 50
		MouseMove, 300, 470
		Sleep, 50
		Click, 300,470
		Sleep, 400
		ScrollDown(amount)
		Sleep, 200
	}
}
;----------------------------------
ScrollClickStop() {
	global scroll_click_go
	scroll_click_go = 0	
}
;----------------------------------

;----------------------------------

;---------- ScrollUp() --------------
ScrollUp(amount) {
;	Loop, 5 {
;    	MouseClick, WheelUp
;	}

	counter = 0
	While counter < amount {
		counter := counter + 1
		Send, {WheelUp}
		Sleep, 100
	}
}
;---------- ScrollDown() ------------
ScrollDown(amount) {
	counter = 0
	While counter < amount {
		counter := counter + 1
		Send, {WheelDown}
		Sleep, 60
	}
}

;----------------------------------
AttackFFA() {
	global train_click
	Sleep, 50
	MouseMove, train_click[1], train_click[2]
	Sleep, 50
	Send, n
	Sleep, 100
	SimpleClick()
	SimpleClick()
	Sleep, 100
	Send, c
	Sleep, 100
	SimpleClick()
	SimpleClick()
	Sleep, 100
	Send, f
	Sleep, 100
	SimpleClick()
	SimpleClick()
	Sleep, 100
;	Send, g
	Sleep, 100
	SimpleClick()
	SimpleClick()
	Sleep, 100
	Sleep, 100
	Send, {w Down}
	DoubleJump()
	Send, {w Up}
	Sleep, 100
	Send, {d Down}
	Send, {d Up}
	Send, y
	SimpleClick()
	Sleep, 100
	Send, f
	Send, c
	SimpleClick()
	Sleep, 100
	Send, g
	Send, e
	Sleep, 100
	SimpleClick()
	Sleep, 100
	Send, {Right Down}
	Sleep, 160
	Send, {Right Up}
	Sleep, 200
;	SimpleClick()
	SimpleClick()
}




;______________________________________________________________________

; ========= KEYBOARD SHORTCUTS ==========

^+a::TrainingA()
^+b::TrainingB()
^+c::TrainingC()
^+d::TrainingD()
^+e::TrainingE()

^+g::GetSword(4)

^+s::StopDestruction()

i::MightyAttack1()
o::AttackPrep()
^+o::GetChampion()
^+i::GetMarco()

`::TrainingOneVOne()
CapsLock::DeploySuperAttack()
,::SuperAttack()
.::ReequipSuperAttack()

^+z::Pause
^+x::ExitApp

;+s::ScrollClick(scroll_amount)
;^+s::ScrollClickStop()

;^+1::Opponent_1(opponent_1[1], opponent_1[2])
;^+2::Opponent_2(opponent_2[1], opponent_2[2])
;^+3::Opponent_3(opponent_3[1], opponent_3[2])
;^Space::BannerClick(banner_x, banner_y)
;^+Space::BannerClick(banner_x, banner_y)
;^+a::PlayCard(c1[1], c1[2], end_x, end_y)
;^+a::PlayCard(start_x, start_y, end_x, end_y)
;+Space::OpponentClick(opponent_x, opponent_y)
;^+c::ChooseOpponent(opponent_x, opponent_y)


