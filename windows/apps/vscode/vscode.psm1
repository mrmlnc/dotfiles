$ResourceConfigDir = Join-Path $PSScriptRoot "resources"
$ApplicationConfigDir = Join-Path $env:APPDATA "Code" "User"

$Extensions = @(
    "alefragnani.bookmarks"
    "be5invis.vscode-icontheme-nomo-dark"
    "coenraads.bracket-pair-colorizer-2"
    "davidanson.vscode-markdownlint"
    "dbaeumer.vscode-eslint"
    "editorconfig.editorconfig"
    "eg2.tslint"
    "emilast.logfilehighlighter"
    "github.vscode-pull-request-github"
    "ipatalas.vscode-postfix-ts"
    "johnstoncode.svn-scm"
    "ms-azure-devops.azure-pipelines"
    "ms-python.python"
    "ms-vscode.powershell"
    "oderwat.indent-rainbow"
    "peterjausovec.vscode-docker"
    "redhat.vscode-yaml"
    "rust-lang.rust"
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
