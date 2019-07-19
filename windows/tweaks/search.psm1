function Setup {
    # Hide search box on TaskBar
    Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -Value 0
}
