;backforth.ahk
;ExitApp

Pause On

While 1 = 1 {
  Sleep, 100
  Espada()
  Sleep, 400
  Send, {w Down}
  Sleep, 200
  Loop, 14 {
    Espada()
  }
  Sleep, 200
  Send, {w Up}
  Sleep, 200
  Espada()
  Sleep, 200
  Espada()
  Sleep, 400
  Send, {s Down}
  Sleep, 200
  Loop, 14 {
    Espada()
  }
  Sleep, 203
  Send, {s Up}
  Sleep, 200
  Espada()
  Sleep, 100
}


Espada() {       ;------------------  ESPADA
  Sleep, 100
  Click, 200, 200
  Sleep, 100
}

ExitRoutine() {
  Send, {w Up}
  Send, {s Up}
  ExitApp
}

;____________________________________________

; ========= KEYBOARD SHORTCUTS ==========

^+e::Espada()           ; ctrl + shift + e

^+z::Pause              ; ctrl + shift + z
^+x::ExitRoutine()      ; ctrl + shift + x

