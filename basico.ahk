;afs.ahk
;ExitApp

Pause On

Chakra() {				;------------------  CHAKRA
	While 1 = 1 {
		Sleep, 795
		Send, 3
	}
}


Espada() {        ;------------------  ESPADA
	while 1 = 1 {
		Sleep, 100
		Click, 200, 200
	}
}


;______________________________________________________________________

; ========= KEYBOARD SHORTCUTS ==========

^+c::Chakra()        ; ctrl + shift + c
^+e::Espada()        ; ctrl + shift + e

^+z::Pause           ; ctrl + shift + z
^+x::ExitApp         ; ctrl + shift + x
