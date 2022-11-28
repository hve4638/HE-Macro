;	YT (Last Changed: 2022/11/23)
#NoEnv
#Warn
#SingleInstance, Force
SendMode Input
SetWorkingDir %A_ScriptDir%
SetKeyDelay, -1
;ctrl ^
;shift +
;win #
;alt !

showToolTip("Numpad for youtube", 500)

NumpadDiv::X
NumpadMult::C
NumpadDot::+#s

Numpad1::F
Numpad2::Down
Numpad3::^!r
Numpad4::Left
Numpad5::Space
Numpad6::Right
Numpad7::<
Numpad8::Up
Numpad9::>
Numpad0::
	Click, Middle
	Sleep, 100
	Click, Middle
	Return

showToolTip(message, time) {
	ToolTip, %message%
	SetTimer, RemoveToolTip, -%time%
}

	
RemoveToolTip:
	ToolTip,
	return