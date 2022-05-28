#Import-Module PSReadLineKeyHandler, posh-git, oh-my-posh
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord "RightArrow" -Function ForwardWord
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PoshPrompt bubbles
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
oh-my-posh prompt init pwsh --config ~\Documents\PowerShell\themes\themes.json | Invoke-Expression
function _sudo {
    $ss = "$args ; pause"
    Start-Process pwsh -Verb runAs -ArgumentList $ss
}
set-alias  -name sudo -value _sudo
function getlist {Get-ChildItem -Name}
function wslvim {
  $ss = "$args"
  wsl vim $ss
}
function wslzsh {
  $ss = "$args"
  wsl zsh $ss
}
function wslbash {
  $ss = "$args"
  wsl bash $ss
}
Set-Alias ls getlist
Set-Alias zsh wslzsh
Set-Alias vim wslvim
Set-Alias bash wslbash
Get-Content ~\Documents\PowerShell\Powershell_out.txt
