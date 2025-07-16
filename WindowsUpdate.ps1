. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Windows Update & Store Restrictions ===`n"

# Disable access to Store
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'RemoveWindowsStore' -DesiredValue 1

# Disable OS upgrade offers
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'DisableOSUpgrade' -DesiredValue 1

# Disable Store apps (optional, set to 0 to allow private store only)
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'DisableStoreApps' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'RequirePrivateStoreOnly' -DesiredValue 1

# Configure Automatic Updates
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoUpdate' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'AUOptions' -DesiredValue 4
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'ScheduledInstallDay' -DesiredValue 0

# Disable "Pause updates" UX
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'SetDisablePauseUXAccess' -DesiredValue 1

# Disable preview builds
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'ManagePreviewBuilds' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Name 'AllowBuildPreview' -DesiredValue 0

# Feature update deferral
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferFeatureUpdates' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferFeatureUpdatesPeriodInDays' -DesiredValue 180

# Quality update deferral
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferQualityUpdates' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferQualityUpdatesPeriodInDays' -DesiredValue 0

# Disable optional updates
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'EnableOptionalUpdates' -DesiredValue 0

# Disable auto-restart with logged-on users
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'NoAutoRebootWithLoggedOnUsers' -DesiredValue 0

Write-Host "`n✔ Windows Update policies applied.`n"
