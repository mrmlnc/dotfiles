Import-Module (Join-Path $env:ChocolateyInstall "helpers" "chocolateyInstaller.psm1") -Force

function IsInstalledApplication([string] $Name) {
    return [bool](Get-AppInstallLocation $Name)
}

function UpdateSessionEnvironment {
    Update-SessionEnvironment
}

Export-ModuleMember *

