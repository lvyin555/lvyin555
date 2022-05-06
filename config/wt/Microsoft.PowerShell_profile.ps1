#Import-Module PSReadLineKeyHandler
#Import-Module posh-git
#Import-Module oh-my-posh
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Chord "RightArrow" -Function ForwardWord
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PoshPrompt bubbles
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
oh-my-posh prompt init pwsh --config C:\Users\14413\AppData\Local\oh-my-posh\themes/jandedobbeleer.omp.json | Invoke-Expression
function _sudo {
    $ss = "$args ; pause"
    Start-Process powershell -Verb runAs -ArgumentList $ss
}
set-alias  -name sudo -value _sudo
Set-PSReadLineOption -Colors @{
  Command            = 'Green'
  Number             = 'Green'
  Member             = 'Green'
  Operator           = 'Yellow'
  Type               = 'Green'
  Variable           = 'Yellow'
  Parameter          = 'Yellow'
  ContinuationPrompt = 'Green'
  Default            = 'Green'
}
cat ~\Documents\Powershell_out.txt
