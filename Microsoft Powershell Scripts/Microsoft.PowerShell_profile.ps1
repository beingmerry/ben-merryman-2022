Function Test-Elevated {
  $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
  $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  $prp.IsInRole($adm)
}
# <-------------------------------------------------------------------------------------------------------->
Write-Output "Edit this shell at..."
Write-Output "C:\Users\benme\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
If (Test-Elevated) {
  Write-Output "WARNING -- Admin Mode "
} Else {
  Write-Output "Normal Mode"
}
# <-------------------------------------------------------------------------------------------------------->
# 2022-12-02 Bit of a pointless function...but good to show argument passing to functions
function Change-My-Working-Folder-To([string]$Directory)
{
  Set-Location "$Directory"
}
function Advent-2022()
{
  Set-Location C:\Users\benme\Development\AdventOfCode\Advent-of-Code-2022
}
# 🎯 New-Item -Path Alias:r -Value "exit start shell"
# NEXT toDo 🏗️ Build a function or figure out how to restart shell
# NEXT toDo 🏗️ Make PowerShell PRETTY!
# <-------------------------------------------------------------------------------------------------------->
## Steps for building a local directory to create version control in 1 file for temporary aliases
# Create module '2022-12-02-BenMerryman'
# 1. Create the module folder...
$tmpDir = [io.path]::GetTempPath() + '/' + $PID + '/2022-12-02-BenMerryman'
Push-Location (New-Item -Type Directory -Force $tmpDir)
# 2. and a manifest with a version number and the aliases to export
New-ModuleManifest -Path ./2022-12-02-BenMerryman.psd1 -RootModule 2022-12-02-BenMerryman.psm1 -ModuleVersion 1.0.0 -AliasesToExport date, aliases, a, folderIWant
# 3. and the module implementation with the 3 aliases
@'
set-alias date Get-Date
set-alias aliases Get-Alias
set-alias a Advent-2022
set-alias folderIWant Change-My-Working-Folder-To
'@ > 2022-12-02-BenMerryman.psm1
# 4. Import the module. Add -Verbose to see import details.
Import-Module -Force ../2022-12-02-BenMerryman
# 5. Get information about the aliases. (leave out for silent?)
Get-Command -Type Alias date, aliases, a, folderIWant
# 6. Clean up. Pop location and remove the temporary files created in tmpDir
Pop-Location
Remove-Item -Recurse $tmpDir