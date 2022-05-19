#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Misc.au3>
Global $g_bPaused = False

While 1
        Sleep(10)
		If($g_bPaused) Then
			send("f")
		EndIf
		if(_IsPressed(5))Then
			$g_bPaused=True
			EndIf
		if(_IsPressed(6))Then
			$g_bPaused=False
			EndIf
	WEnd
