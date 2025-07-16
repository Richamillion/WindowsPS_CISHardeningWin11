. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Privacy & Telemetry Controls ===`n"

# Telemetry and data collection
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DisableEnterpriseAuthProxy' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DisableOneSettingsDownloads' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DoNotShowFeedbackNotifications' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'EnableOneSettingsAuditing' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'LimitDiagnosticLogCollection' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'LimitDumpCollection' -DesiredValue 1

# Advertising ID
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' -Name 'DisabledByGroupPolicy' -DesiredValue 1

# Widgets and Cortana
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds' -Name 'EnableWidgets' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortanaAboveLock' -DesiredValue 0

# OneDrive
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive' -Name 'DisableFileSync' -DesiredValue 1

# Location services
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name 'DisableLocation' -DesiredValue 1

# Messaging
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging' -Name 'AllowMessageSync' -DesiredValue 0

# Cloud content
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableConsumerAccountStateContent' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableCloudOptimizedContent' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -DesiredValue 1

Write-Host "`n✔ Privacy controls applied.`n"
