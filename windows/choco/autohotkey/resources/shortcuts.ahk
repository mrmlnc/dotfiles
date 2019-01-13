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
