;	HE_Macro v2.0 (Last Changed: 2022/09/04)
#NoEnv
;#Warn
#SingleInstance, Force
SendMode Input
SetWorkingDir %A_ScriptDir%
SetKeyDelay, -1
;ctrl ^
;shift +
;win #
;alt !


;+Del::Delete
;^Home::Home
;^End::End
;PrintScreen::#PrintScreen
;^;::HOME
;^'::END
;^u::HOME
;^i::END
;+^;::+HOME
;+^'::+END
;#c::PrintScreen

showToolTip("HE Macro 2.0", 500)

fnEnabled := true
magicFnMode := false
debugToolTipEnabled := false
infoIsVisibled := false

^,::send, {HOME}
^.::send, {END}
+^,::Send, {ShiftDown}{HOME}
+^.::Send, {ShiftDown}{END}

^#r::Reload  ; Ctrl+Alt+R

*CapsLock::
	magicFnMode := true
	return

CapsLock Up::
	magicFnMode := false
	resetCompositeKey()
	return

#if magicFnMode
	*1::F1
	*2::F2
	*3::F3
	*4::F4
	*5::F5
	*6::F6
	*7::F7
	*8::F8
	*9::F9
	*0::F10
	*-::F11
	*=::F12

	#r::
		reload
		Sleep, 1000
		ToolTip, rIeload failed
		return
	#4::ExitApp, 0
	
	*z::^z
	*x::^x
	*c::^c
	*v::^v

	*b::Mbutton

	*i::up
	*k::down
	*j::left
	*l::right

	*a::left
	*d::right
	*u::home
	*o::end
	*;::enter
	*n::BackSpace
	*m::Delete

	*q::send, {Ctrl Down}
	*q Up::send, {Ctrl Up}
	*w::send, {Shift Down}
	*w Up::send, {Shift Up}
	*e::toggleCapslock()
	*r::Insert
	
	*h::Send, {vk15sc138}
	*p::+#s

#if
	toggleCapslock() {
		if isCapslockEnabled()
			SetCapslockState, off
		else
			SetCapslockState, on
		return
	}

	isCapslockEnabled() {
		isDown := GetKeyState("CapsLock", "T")
		if (isDown)
			return True
		else
			return False
	}

	resetCompositeKey() {
		send, {Ctrl Up}
		send, {Shift Up}
	}

	playBeepRestart() {
		SoundBeep, 523, 120
		Sleep, 50
		SoundBeep, 523, 120		
	}

	showToolTip(message, time) {
		ToolTip, %message%
		SetTimer, RemoveToolTip, -%time%
	}
	
	RemoveToolTip:
		ToolTip,
		return

;	SoundActive() {
;		SoundBeep, 523, 100
;		Sleep, 50
;		SoundBeep, 700, 100
;	}

;	SoundDeactive() {
;		SoundBeep, 523, 100
;		Sleep, 50
;		SoundBeep, 346, 100
;	}