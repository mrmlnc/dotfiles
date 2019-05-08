#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Common

!T:: Send ^t ; Alt + T (Ctrl + T)
!+T:: Send ^+t ; Alt + Shift + T (Ctrl + Shift + T)
!SC01A:: Send ^+{Tab} ; Ctrl + Alt + [ (Ctrl + Shift + Tab)
!SC01B:: Send ^{Tab} ; Ctrl + Alt + ] (Ctrl + Tab)
!q:: Send !{F4} ; Alt + q (Alt + F4)

; Typography hotkeys

!SC028:: Send {Asc 0171} ; Alt + ' («)
!^SC028:: Send {Asc 0187} ; Alt + Shift + ' (»)
!SC00C:: Send {Asc 0151} ; Alt + - (—)
!^T:: Send {Asc 0153} ; Alt + Ctrl + T (™)
!SC035:: Send {Asc 0133} ; Alt + / (…)
!Right:: Send {U+2192} ; Alt + Right (→)
