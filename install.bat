@echo off

setlocal ENABLEDELAYEDEXPANSION

rem PROGRAM LIST
set programNames=(opera googlechrome firefox winrar 7zip.install adobereader flashplayerplugin jre8 vlc spotify git.install sublimetext3 notepadplusplus.install vscode bitnami-xampp putty.install nodejs.install skype filezilla ccleaner python3 teamviewer putty)
set index=0

for %%p in %programNames% do (
    
    echo !index! - %%p
    
    set programIndexes[!index!]=%%p
    set /a index=!index! + 1

)

:prompt
    echo Write the numbers of the programs you want to install on the computer, separated by space
    set /p install=""

    if "%install%" equ "" (

        goto prompt

    )

where choco >nul 2>&1 && echo chocolatey already installed || ( 
    
    echo installing chocolatey

    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

)

for %%a in (%install%) do (

    choco install !programIndexes[%%a]! -y

)

REM pause