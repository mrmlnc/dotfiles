$ResourceConfigDir = Join-Path $PSScriptRoot "resources"
$ApplicationConfigDir = $HOME

function Install {
    choco install git
}

function Configure {
    CopyDirectoryItems -Path $ResourceConfigDir -Target $ApplicationConfigDir

    $CurrentGitUser = git config --global --get user.name
    $CurrentGitEmail = git config --global --get user.email

    if ($CurrentGitUser -eq "name") {
        $CurrentGitUser = Read-Host -Prompt "Enter your full name ($CurrentGitUser)"
    }
    if ($CurrentGitEmail -eq "email") {
        $CurrentGitEmail = Read-Host -Prompt "Enter your e-mail ($CurrentGitEmail)"
    }

    git config --global user.name "$CurrentGitUser"
    git config --global user.email "$CurrentGitEmail"
}
