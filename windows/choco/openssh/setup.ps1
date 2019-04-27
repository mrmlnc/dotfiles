Import-Module -Name "$PSScriptRoot\..\..\utils.ps1" -Force

$DefaultOpensshDirectory = 'C:\Windows\System32\OpenSSH\';

# Unfortunately, choco does not provide way to obtain the installation path
$InstallationDirectory = 'C:\Program Files\OpenSSH-Win64';

if (Get-Service 'sshd' -ErrorAction SilentlyContinue) {
    [Logger]::Uninstall("Windows OpenSSH Feature")

    powershell.exe -Command "Remove-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0"
    powershell.exe -Command "Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0"

    Remove-Service -Name sshd
    Remove-Service -Name ssh-agent
}

[Logger]::Install("OpenSSH")

choco install openssh -params "/SSHAgentFeature"

[Logger]::Setup("OpenSSH")

$path = [System.Environment]::GetEnvironmentVariable('PATH', 'Machine');
$envs = $path.Split(';') | Where-Object { $_ -ne $DefaultOpensshDirectory } | Where-Object { $_ -ne '' };
$envs += $InstallationDirectory;
$path = ($envs | Select-Object -Unique) -join ';';
[System.Environment]::SetEnvironmentVariable('PATH', $path, 'Machine');
