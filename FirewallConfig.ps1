. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Firewall Configuration ===`n"

# Domain Profile
Set-NetFirewallProfile -Profile Domain -Enabled True
Set-NetFirewallProfile -Profile Domain -DefaultInboundAction Block
Set-NetFirewallProfile -Profile Domain -NotifyOnListen False
Set-NetFirewallLogging -Profile Domain -LogFileName "$env:SystemRoot\System32\logfiles\firewall\domainfw.log"
Set-NetFirewallLogging -Profile Domain -LogMaxSizeKilobytes 16384
Set-NetFirewallLogging -Profile Domain -LogDroppedPackets Enabled
Set-NetFirewallLogging -Profile Domain -LogSuccessfulConnections Enabled

# Private Profile
Set-NetFirewallProfile -Profile Private -Enabled True
Set-NetFirewallProfile -Profile Private -DefaultInboundAction Block
Set-NetFirewallProfile -Profile Private -NotifyOnListen False
Set-NetFirewallLogging -Profile Private -LogFileName "$env:SystemRoot\System32\logfiles\firewall\privatefw.log"
Set-NetFirewallLogging -Profile Private -LogMaxSizeKilobytes 16384
Set-NetFirewallLogging -Profile Private -LogDroppedPackets Enabled
Set-NetFirewallLogging -Profile Private -LogSuccessfulConnections Enabled

# Public Profile
Set-NetFirewallProfile -Profile Public -Enabled True
Set-NetFirewallProfile -Profile Public -DefaultInboundAction Block
Set-NetFirewallProfile -Profile Public -NotifyOnListen False
Set-NetFirewallProfile -Profile Public -AllowLocalFirewallRules False
Set-NetFirewallProfile -Profile Public -AllowLocalIPsecRules False
Set-NetFirewallLogging -Profile Public -LogFileName "$env:SystemRoot\System32\logfiles\firewall\publicfw.log"
Set-NetFirewallLogging -Profile Public -LogMaxSizeKilobytes 16384
Set-NetFirewallLogging -Profile Public -LogDroppedPackets Enabled
Set-NetFirewallLogging -Profile Public -LogSuccessfulConnections Enabled

Write-Host "`n✔ Firewall profiles configured.`n"
