$DefaultOpensshDirectory = 'C:\Windows\System32\OpenSSH\'

# Unfortunately, choco does not provide way to obtain the installation path
$InstallationDirectory = 'C:\Program Files\OpenSSH-Win64'

function Before {
    if (Get-Service -Include "sshd") {
        powershell.exe -Command "Remove-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0"
        powershell.exe -Command "Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0"
    }

    if (Get-Service -Include "sshd") {
        Remove-Service -Name sshd
    }

    if (Get-Service -Include "ssh-agent") {
        Remove-Service -Name ssh-agent
    }
}

function Install {
    choco install openssh -params "/SSHAgentFeature"
}

function Configure {
    $path = [System.Environment]::GetEnvironmentVariable('PATH', 'Machine')

    $envs = $path.Split(';') | Where-Object { $_ -ne $DefaultOpensshDirectory } | Where-Object { $_ -ne '' }
    $envs += $InstallationDirectory

    $path = ($envs | Select-Object -Unique) -join ';'

    [System.Environment]::SetEnvironmentVariable('PATH', $path, 'Machine')
}
