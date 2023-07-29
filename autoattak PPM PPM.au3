
#include <Misc.au3>
Global $g_bPaused = False

While 1
        Sleep(10)
		If($g_bPaused) Then
			send("f")
		EndIf
		if(_IsPressed(5)) Then
			send("f")
		EndIf
		if(_IsPressed(6)) Then
			MouseClick("left",MouseGetPos(0),MouseGetPos(1),1,100)
		EndIf
	WEnd
