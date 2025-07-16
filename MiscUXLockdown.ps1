. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Miscellaneous UX & UI Lockdowns ===`n"

# Disable picture password
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'BlockPicturePassword' -DesiredValue 1

# Disable convenience PIN sign-in
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'AllowDomainPINLogon' -DesiredValue 0

# Disable lock screen app notifications
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'DisableLockScreenAppNotifications' -DesiredValue 1

# Disable account details on sign-in
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'BlockUserFromShowingAccountDetailsOnSignin' -DesiredValue 1

# Disable network selection UI
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'DontDisplayNetworkSelectionUI' -DesiredValue 1

# Disable user enumeration
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'DontEnumerateConnectedUsers' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnumerateLocalUsers' -DesiredValue 0

# Disable Windows Ink Workspace suggestions
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Name 'AllowSuggestedAppsInWindowsInkWorkspace' -DesiredValue 0

# Allow Ink Workspace but block above lock
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Name 'AllowWindowsInkWorkspace' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Name 'AllowWindowsInkWorkspaceAboveLock' -DesiredValue 0

# Disable Game DVR
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'AllowGameDVR' -DesiredValue 0

# Disable Search highlights
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'EnableDynamicContentInWSB' -DesiredValue 0

# Disable Cortana location use
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowSearchToUseLocation' -DesiredValue 0

# Disable indexing of encrypted files
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowIndexingEncryptedStoresOrItems' -DesiredValue 0

# Disable shell protocol protected mode
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'PreXPSP2ShellProtocolBehavior' -DesiredValue 0

# Disable heap termination on corruption
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoHeapTerminationOnCorruption' -DesiredValue 0

# Disable DEP for Explorer
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoDEP' -DesiredValue 0

# Disable account-based insights
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'DisableAccountBasedInsights' -DesiredValue 1

Write-Host "`n✔ Miscellaneous UX lockdowns applied.`n"
