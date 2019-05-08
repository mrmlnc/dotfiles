function Setup {
    # Hide «People» icon on TaskBar
    Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Name PeopleBand -Value 0
}
