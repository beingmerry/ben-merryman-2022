Function Test-Elevated {
  $wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
  $adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  $prp.IsInRole($adm)
}
Write-Output "Edit this shell at..."
Write-Output "C:\Users\benme\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
If (Test-Elevated) {
  Write-Output "WARNING -- Admin Mode "
} Else {
  Write-Output "Normal Mode"
}


# Create module '2022-12-02':

# Create the module folder...
$tmpDir = [io.path]::GetTempPath() + '/' + $PID + '/2022-12-02'
Push-Location (New-Item -Type Directory -Force $tmpDir)

# ... and a manifest with a version number and the aliases to export ...
New-ModuleManifest -Path ./2022-12-02.psd1 -RootModule 2022-12-02.psm1 -ModuleVersion 1.0.0 -AliasesToExport date, aliases

# ... and the module implementation with the two aliases
@'
set-alias date Get-Date
set-alias aliases Get-Alias
'@ > 2022-12-02.psm1

# New-Item -Path Alias:r -Value "exit start shell"
# Import the module. Add -Verbose to see import details.
Import-Module -Force ../2022-12-02

# Get information about the aliases.
Get-Command -Type Alias date, aliases

# Clean up.
Pop-Location
Remove-Item -Recurse $tmpDir