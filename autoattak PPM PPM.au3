
#include <Misc.au3>

Global $botAktywny = False

HotKeySet("^t", "ToggleBot")

While 1
	Sleep(10)
	If (_IsPressed("1B")) Then
		DeactivateBot()
		$botAktywny = False
	EndIf
	If (_IsPressed("0D")) Then
		DeactivateBot()
		$botAktywny = False
	EndIf
	If (_IsPressed(5)) Then
		Send("f")
	EndIf
	If (_IsPressed(6)) Then
		MouseClick("left")
	EndIf
WEnd

Func ToggleBot()
	$botAktywny = Not $botAktywny
	If $botAktywny Then
		ActivateBot()

	Else
		DeactivateBot()

	EndIf
EndFunc   ;==>ToggleBot

Func IsWarframeActive()
    ; Sprawdź, czy aktywne jest okno o tytule "Warframe"
    Local $title = WinGetTitle("[ACTIVE]")
    Return StringInStr($title, "Warframe") > 0
EndFunc

Func ActivateBot()
	 If IsWarframeActive() Then
	ToolTip("Bot aktywny", @DesktopWidth - 200, @DesktopHeight - 160)
	AdlibRegister("Press4", 2000)
	AdlibRegister("CheckAndPress2", 1000)
	AdlibRegister("Press3", 100)
	EndIf
EndFunc   ;==>ActivateBot3

Func DeactivateBot()
	ToolTip("Bot dezaktywowany", @DesktopWidth - 200, @DesktopHeight - 160)
	AdlibUnRegister("Press4")
	AdlibUnRegister("CheckAndPress2")
	AdlibUnRegister("Press3")
EndFunc   ;==>DeactivateBot

Func Press4()

	If $botAktywny And IsWarframeActive() Then
		Send("4")
		AdlibRegister("Press4", 14000 + Random(300, 500))
	EndIf
EndFunc   ;==>Press4

Func CheckAndPress2()
    If $botAktywny And IsWarframeActive() Then
        Local $searchResult = PixelSearch(950, 538, 970, 540, 0xC62619, 50)

        If Not @error  Then
            ; Znaleziono obszar o kolorze zbliżonym do czerwonego w zasięgu 10 pixeli od punktu (960, 5390)
            Send("2")
        EndIf
    EndIf

    AdlibRegister("CheckAndPress2", 500)
EndFunc


Func Press3()
    If $botAktywny And IsWarframeActive() Then
        ; Sprawdź, czy w zasięgu 4 pixeli od punktu (1776, 1023) nie znajduje się kolor 0x2F3E40
        Local $searchResult = PixelSearch(1772, 1019, 1780, 1027, 0x2F3E40, 4)

        ; Jeśli nie znaleziono koloru, wykonaj akcję
        If @error Then
            Send("3")
        Else
			Local $counter = 0
            ; Jeśli znaleziono kolor, poczekaj, aż zniknie
            While $counter < 5 OR Not @error
				$counter = $counter + 1
                Sleep(300)
                $searchResult = PixelSearch(1772, 1019, 1780, 1027, 0x2F3E40, 4)
            WEnd
        EndIf
    EndIf

    AdlibRegister("Press3", 2300 + Random(300, 500))
EndFunc
