#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!T::
Send, ^t
Return

!+T::
Send, ^+t
Return

!+}::
Send, ^{Tab}
Return

!+{::
Send, ^+{Tab}
Return

!q::
Send, !{F4}
Return

!SC028:: ; Alt + ' («)
Send, {Asc 0171}
return

!^SC028:: ; Alt + Shift + ' (»)
Send, {Asc 0187}
return

!SC00C:: ; Alt + - (—)
Send, {Asc 0151}
Return

!^T:: ; Alt + Ctrl + T (™)
Send, {Asc 0153}
Return

!SC035:: ; Alt + / (…)
Send, {Asc 0133}
Return
