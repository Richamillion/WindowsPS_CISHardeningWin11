. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying BitLocker Configuration ===`n"

# OS Drive Settings
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRecovery' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRecoveryPassword' -DesiredValue 2
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRecoveryKey' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSHideRecoveryPage' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSActiveDirectoryBackup' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSConfigureRecoveryInformation' -DesiredValue 2
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRequireActiveDirectoryBackup' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSAllowSecureBootForIntegrity' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'AllowNoTPM' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'ConfigureTPMStartup' -DesiredValue 2
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'ConfigureTPMPin' -DesiredValue 2
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'ConfigureTPMKey' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'ConfigureTPMKeyPIN' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'UseAdvancedStartup' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSHardwareEncryption' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSUsePassphrase' -DesiredValue 0

# Fixed Data Drives
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRecovery' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRecoveryPassword' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRecoveryKey' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVHideRecoveryPage' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVActiveDirectoryBackup' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVConfigureRecoveryInformation' -DesiredValue 2
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRequireActiveDirectoryBackup' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVHardwareEncryption' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVUsePassphrase' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVUseSmartCard' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRequireSmartCard' -DesiredValue 1

# Removable Drives
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRecovery' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRecoveryPassword' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRecoveryKey' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVHideRecoveryPage' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVActiveDirectoryBackup' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVConfigureRecoveryInformation' -DesiredValue 2
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRequireActiveDirectoryBackup' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVHardwareEncryption' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVUsePassphrase' -DesiredValue 0
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVUseSmartCard' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRequireSmartCard' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVDenyWriteAccess' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVDenyCrossOrg' -DesiredValue 0

# DMA protection
Set-RegistryValueIfNeeded -Path 'HKLM\SOFTWARE\Policies\Microsoft\FVE' -Name 'DisableExternalDMAUnderLock' -DesiredValue 1

Write-Host "`n✔ BitLocker configuration applied.`n"
