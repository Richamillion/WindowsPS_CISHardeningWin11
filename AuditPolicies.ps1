. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Audit Policies ===`n"

# Audit subcategories
Set-AuditPolicyIfNeeded -Subcategory "Credential Validation" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Application Group Management" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Security Group Management" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "User Account Management" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Plug and Play Events" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Process Creation" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Account Lockout" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Group Membership" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Logoff" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Logon" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Other Logon/Logoff Events" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Special Logon" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Detailed File Share" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "File Share" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Other Object Access Events" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Removable Storage" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Audit Policy Change" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Authentication Policy Change" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Authorization Policy Change" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "MPSSVC Rule-Level Policy Change" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Other Policy Change Events" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Sensitive Privilege Use" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "IPsec Driver" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Other System Events" -Success "enable" -Failure "enable"
Set-AuditPolicyIfNeeded -Subcategory "Security State Change" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "Security System Extension" -Success "enable"
Set-AuditPolicyIfNeeded -Subcategory "System Integrity" -Success "enable" -Failure "enable"

# Registry-based audit policy overrides
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'SCENoApplyLegacyAuditPolicy' -DesiredValue 1
Set-RegistryValueIfNeeded -Path 'HKLM\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'CrashOnAuditFail' -DesiredValue 0

Write-Host "`n✔ Audit policies applied.`n"
