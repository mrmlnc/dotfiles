choco feature enable -n=allowGlobalConfirmation | Out-Null

LogProcess "Install applications"

foreach ($AppModule in Get-Item "$PSScriptRoot\*\*.psm1") {
    $ModuleName = $AppModule.BaseName

    Import-Module $AppModule -Force

    $ModuleFunctions = (Get-Module $ModuleName).ExportedFunctions
    $LifecycleFunctions = @("Skip", "Before", "Install", "Configure", "After")

    $RunOnlyConfigureFunction = $false

    foreach ($LifecycleStep in $LifecycleFunctions) {
        $IsExistLifecycleStep = $ModuleFunctions.ContainsKey($LifecycleStep)
        $IsRunWithOnlyConfigureStep = $RunOnlyConfigureFunction -and ($LifecycleStep -ne "Configure")

        if (!$IsExistLifecycleStep -or $IsRunWithOnlyConfigureStep) {
            continue
        }

        LogProcess "[$ModuleName] call step: $LifecycleStep"

        if ($LifecycleStep -eq "Skip" -and (Invoke-Expression $ModuleFunctions[$LifecycleStep])) {
            LogProcess "[$ModuleName] Application is already installed. Run configuration command if it exist."

            $RunOnlyConfigureFunction = $true

            continue
        }

        Invoke-Expression $ModuleFunctions[$LifecycleStep]

        if ($LifecycleStep -eq "Install") {
            UpdateSessionEnvironment
        }
    }

    Remove-Module -Name $ModuleName -Force -Verbose:$false
}

choco feature disable -n=allowGlobalConfirmation | Out-Null

