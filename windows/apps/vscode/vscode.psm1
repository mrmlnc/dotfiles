$ResourceConfigDir = Join-Path $PSScriptRoot "resources"
$ApplicationConfigDir = Join-Path $env:APPDATA "Code" "User"

$Extensions = @(
    "alefragnani.bookmarks"
    "arjun.swagger-viewer"
    "be5invis.vscode-icontheme-nomo-dark"
    "bungcip.better-toml"
    "coenraads.bracket-pair-colorizer-2"
    "davidanson.vscode-markdownlint"
    "dbaeumer.vscode-eslint"
    "editorconfig.editorconfig"
    "eg2.tslint"
    "emilast.logfilehighlighter"
    "github.vscode-pull-request-github"
    "ipatalas.vscode-postfix-ts"
    "johnstoncode.svn-scm"
    "marclipovsky.string-manipulation"
    "marp-team.marp-vscode"
    "ms-azure-devops.azure-pipelines"
    "ms-azuretools.vscode-docker"
    "ms-python.python"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode.azure-account"
    "ms-vscode.cpptools"
    "ms-vscode.powershell"
    "oderwat.indent-rainbow"
    "redhat.vscode-yaml"
    "rust-lang.rust"
    "serayuzgur.crates"
    "slevesque.vscode-autohotkey"
    "streetsidesoftware.code-spell-checker-russian"
    "streetsidesoftware.code-spell-checker"
    "visualstudioexptteam.vscodeintellicode"
)

function Install {
    choco install vscode
}

function Configure {
    New-Item -Path $ApplicationConfigDir -ItemType Directory -Force
    CopyDirectoryItems -Path $ResourceConfigDir -Target $ApplicationConfigDir

    $InstalledExtensions = code --list-extensions
    $PendingExtensions = $Extensions | Where-Object { $_ -notin $InstalledExtensions }

    foreach ($Extension in $PendingExtensions) {
        code --install-extension $Extension
    }
}
