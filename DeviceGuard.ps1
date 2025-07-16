. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Device Guard & Credential Guard Settings ===`n"

# Enable Credential Guard
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'LsaCfgFlags' -DesiredValue 1

# Enable Virtualization Based Security
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'EnableVirtualizationBasedSecurity' -DesiredValue 1

# Require Secure Boot or higher
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'RequirePlatformSecurityFeatures' -DesiredValue 1

# Enable Hypervisor Enforced Code Integrity
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'HypervisorEnforcedCodeIntegrity' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'HVCIMATRequired' -DesiredValue 1

# Require UEFI Memory Attributes Table
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'RequireUefiMemoryAttributesTable' -DesiredValue 1

# Kernel-mode Hardware-enforced Stack Protection
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'KernelEnforcedStackProtection' -DesiredValue 2

# LSASS as a protected process
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RunAsPPL' -DesiredValue 1

# Disallow custom SSPs
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'AllowCustomSSPs' -DesiredValue 0

Write-Host "`n✔ Device Guard & Credential Guard settings applied.`n"
