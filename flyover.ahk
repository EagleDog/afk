;flyover.ahk
;ExitApp
;____________________________________________

Pause On

min_x :=  250
min_y :=   80
max_x := 1300
max_y :=  580

x_coord := 100
y_coord := 100
coords := [100, 100]

attack_counter := 1

;____________________________________________

;__________________________________ MAIN LOOP _________
While 1 = 1 {
  Sleep, 100
  ChooseAttack()              ; ATTACK
  Sleep, 100
  Move()                 ; MOVE
  Sleep, 500
  CountAttacks()
  Sleep, 100
}

;____________________________________________
;____________________________________________
;____________________________________________


ClickAround() {
  Loop, 16 {
    Sleep, 30
    RandomizeCoords()
    Sleep, 30
  }
}

CountAttacks() {
  global attack_counter
  attack_counter := attack_counter + 1
  if (attack_counter >= 30) {
    attack_counter := 1
  }
}

ChooseAttack() {
  global attack_counter
  ac := attack_counter
  if (ac < 9) or (ac > 13) and (ac < 20) { ; 9, 10, 20, 21, 22
    Sleep, 200
    Attack()
    Sleep, 100
    ClickAround()
  }
}

Attack() {
  global attack_counter
  Switch mod(attack_counter, 3) {
    Case 1:
      Attack3()
    Case 2:
      Attack1()
    Case 0:
      Attack2()
  }
}

Move() {
  global attack_counter
  if (attack_counter <= 15) {
    MoveRight()
  } else {
    MoveLeft()
  }
  if (mod(attack_counter, 3) = 0) {
    Pan()
  }
}
Pan() {
  global attack_counter
  ac := attack_counter
  ; if (ac = 3) {
  ;   PanLeft()
  ; }
  if (ac = 9) {
    PanRight()
  }
  ; if (ac = 9) {
  ;   PanRight()
  ; }
  ; if (ac = 12) {
  ;   PanLeft()
  ; }
  ; if (ac = 15) {
  ;   PanLeft()
  ; }
  ; if (ac = 18) {
  ;   PanLeft()
  ; }
  ; if (ac = 21 ) {
  ;   PanLeft()
  ; }
  if (ac = 21) {
    PanLeft()
  }
  ; if (ac = 27) {
  ;   PanLeft()
  ; }
  ; if (ac = 30) {
  ;   PanLeft()
  ; }
}

MoveLeft() {
  Sleep, 100
  Send, {a Down}
  Sleep, 1400
  Send, {a Up}
  Sleep, 400
}
MoveRight() {
  Sleep, 100
  Send, {d Down}
  Sleep, 1400
  Send, {d Up}
  Sleep, 400
}
PanLeft() {
  Sleep, 100
  Send, {Left Down}
  Sleep, 1200
  Send, {Left Up}
  Sleep, 100
}
PanRight() {
  Sleep, 100
  Send, {Right Down}
  Sleep, 1200
  Send, {Right Up}
  Sleep, 100
}

;_______________________________________ ATTACKS ______
Attack1() {
  Sleep, 100
  Send, qqqqq
  Sleep, 100
}
Attack2() {
  Sleep, 100
  Send, hhhhh
  Sleep, 100
}
Attack3() {
  Sleep, 100
  Send, ccccc
  Sleep, 100
}
Attack4() {
  Sleep, 100
  Send, nnnnn
  Sleep, 100
}
Attack5() {
  Sleep, 300
  Send, fffff
  Sleep, 100
}

RandomizeCoords() {
  global min_x
  global min_y
  global max_x
  global max_y
  global x_coord
  global y_coord
  global coords
  Random, x_coord, min_x, max_x
  Random, y_coord, min_y, max_y
  coords := [x_coord, y_coord]
  Sleep, 30
  MouseMove, coords[1], coords[2]
  Sleep, 30
}




;____________________________________________

IsEven(n) {
  return mod(n, 2) = 0
}

ExitRoutine() {
  Send, {Right Up}
  Send, {Left Up}
  ExitApp
}
;____________________________________________
; ========= KEYBOARD SHORTCUTS ==========

^+z::Pause
^+x::ExitRoutine()

;____________________________________________
