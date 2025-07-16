. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Remote Desktop & Terminal Services Lockdown ===`n"

# Disable RDP
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -DesiredValue 1

# Require NLA
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'UserAuthentication' -DesiredValue 1

# Require SSL security layer
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'SecurityLayer' -DesiredValue 2

# Require high encryption
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'MinEncryptionLevel' -DesiredValue 3

# Always prompt for password
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fPromptForPassword' -DesiredValue 1

# Require secure RPC
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fEncryptRPCTraffic' -DesiredValue 1

# Idle and disconnected session timeouts
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'MaxIdleTime' -DesiredValue 900000  # 15 min
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'MaxDisconnectionTime' -DesiredValue 60000  # 1 min

# Redirection restrictions
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableCdm' -DesiredValue 1  # Drive
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableCcm' -DesiredValue 1  # COM
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableLPT' -DesiredValue 1  # LPT
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisablePNPRedirection' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableLocationRedirection' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'DisableWebAuthnRedirection' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'AllowUIAutomationRedirection' -DesiredValue 0

# Disable password saving
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'DisablePasswordSaving' -DesiredValue 1

Write-Host "`n✔ Remote Desktop lockdown applied.`n"
