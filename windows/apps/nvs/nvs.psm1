function Install {
    choco install nvs
}

function Configure {
    nvs add lts
    nvs use latest

    npm config set msvs_version 2015
    npm config set python C:\Python27\python.exe
}
