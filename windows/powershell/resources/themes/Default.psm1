#requires -Version 2 -Modules posh-git

function Write-Theme {
    param(
        [bool] $LastCommandFailed,
        [string] $With
    )

    $promptSymbolsForegroundColor = GetPromptSymbolsForegroundColor($LastCommandFailed)

    $prompt = Set-Newline
    $prompt += Write-Prompt -Object $Theme.PromptSymbols.StartSymbol -ForegroundColor $promptSymbolsForegroundColor

    if (Test-Administrator) {
        $prompt += Write-Prompt " (admin)" -ForegroundColor $Theme.Colors.AdminForegroundColor
    }

    $currentDirectory = Get-FullPath -dir $pwd
    if ($currentDirectory) {
        $prompt += Write-Prompt -Object " $currentDirectory"
    }

    $gitStatus = Get-VCSStatus
    if ($gitStatus) {
        $prompt += Write-Prompt -Object " [$($gitStatus.Branch)]" -ForegroundColor $Theme.Colors.GitForegroundColor
    }

    $prompt += " > "
    $prompt
}

function GetPromptSymbolsForegroundColor ([bool] $LastCommadFailed) {
    if ($LastCommadFailed) {
        return $Theme.Colors.FailedPromptForegroundColor
    }

    return $Theme.Colors.SuccessPromptForegroundColor
}

$Theme = $global:ThemeSettings

$Theme.PromptSymbols.StartSymbol = ">>"

$Theme.Colors.AdminForegroundColor = [ConsoleColor]::DarkGray
$Theme.Colors.FailedPromptForegroundColor = [ConsoleColor]::DarkRed
$Theme.Colors.SuccessPromptForegroundColor = [ConsoleColor]::DarkGreen

$Theme.Colors.GitForegroundColor = [ConsoleColor]::DarkYellow
