function LogProcess([string] $Message) {
    Write-Host ">>>" -ForegroundColor DarkGray -NoNewline
    Write-Host " " -NoNewline
    Write-Host "[process]" -ForegroundColor DarkBlue -NoNewline
    Write-Host " " -NoNewline
    Write-Host $Message
}

Export-ModuleMember *
