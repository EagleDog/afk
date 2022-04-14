;flyover.ahk
;ExitApp

Pause On

min_x :=  250
min_y :=   80
max_x := 1300
max_y :=  520

x_coord := 100
y_coord := 100
coords := [100, 100]

attack_counter := 1

CountAttacks() {
  global attack_counter
  attack_counter := attack_counter + 1
  if (attack_counter > 40) {
    attack_counter := 1
  }
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
  ; MsgBox, coords: %x_coord%, %y_coord%
}

ClickAround() {
  Loop, 16 {
    Sleep, 30
    RandomizeCoords()
    Sleep, 30
  }
}

While 1 = 1 {
  Sleep, 200
  RandomizeCoords()
  Sleep, 200
  Attack()              ; ATTACK
  Sleep, 200
  ClickAround()
  Sleep, 200
  Move()                 ; MOVE
  Sleep, 500
}


MoveLeft() {
  Sleep, 100
  Send, {a Down}
  Sleep, 1800
  Send, {a Up}
  Sleep, 200
}
MoveRight() {
  Sleep, 100
  Send, {d Down}
  Sleep, 1800
  Send, {d Up}
  Sleep, 200
}
Move() {
  global attack_counter
  if (attack_counter <= 20) {
    MoveRight()
  } else {
    MoveLeft()
  }
  if (mod(attack_counter, 4) = 0) {
    Pan()
  }
}

PanLeft() {
  Sleep, 100
  Send, {Left Down}
  Sleep, 400
  Send, {Left Up}
  Sleep, 100
}
PanRight() {
  Sleep, 100
  Send, {Right Down}
  Sleep, 400
  Send, {Right Up}
  Sleep, 100
}
Pan() {
  global attack_counter
  ac := attack_counter
  if (ac = 4) or (ac = 8) or (ac = 12) or (ac = 16) {
    PanRight()
  }
  if (ac = 24) or (ac = 28) or (ac = 32) or (ac = 36) {
    PanLeft()
  }
}

Attack() {
  global attack_counter
  Switch mod(attack_counter, 5) {
    Case 1:
      Attack1()
    Case 2:
      Attack2()
    Case 3:
      Attack3()
    Case 4:
      Attack4()
    Case 0:
      Attack5()
  }
  CountAttacks()
}

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
  Send, fffff
  Sleep, 100
}
Attack5() {
  Sleep, 300
  Send, nnnnn
  Sleep, 100
}

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


