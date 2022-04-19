;bas  ec 15.ahk
;ExitApp

Pause Off


Chakra() {       ;------------------  CHAKRA
	While 1 = 1 {
		Sleep, 795
		Send, 3
	}
}

Espada() {       ;------------------  ESPADA
	while 1 = 1 {
		Sleep, 100
		Click, 200, 200
	}
}

;____________________________________________

; ========= KEYBOARD SHORTCUTS ==========

^+c::Chakra()        ; ctrl + shift + c
^+e::Espada()        ; ctrl + shift + e

^+p::Pause           ; ctrl + shift + p
^+x::ExitApp         ; ctrl + shift + x

