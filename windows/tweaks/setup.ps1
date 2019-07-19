LogProcess "Apply Windows tweaks"

foreach ($TweakModule in Get-Item "$PSScriptRoot\*.psm1") {
    $ModuleName = $TweakModule.BaseName

    Import-Module $TweakModule -Force

    $ModuleFunctions = (Get-Module $ModuleName).ExportedFunctions
    $LifecycleFunctions = @("Setup", "Destroy")

    foreach ($LifecycleStep in $LifecycleFunctions) {
        if (!$ModuleFunctions.ContainsKey($LifecycleStep)) {
            continue
        }

        LogProcess "[$ModuleName] call step: $LifecycleStep"

        Invoke-Expression $ModuleFunctions[$LifecycleStep]
    }

    Remove-Module $ModuleName -Force -Verbose:$false
}

LogProcess "Reload explorer to pick up tweaks"

Stop-Process -Name explorer
