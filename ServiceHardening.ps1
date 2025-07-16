. "$PSScriptRoot\Shared\Functions.ps1"

Write-Host "`n=== Applying Service Hardening ===`n"

# Disable services
$servicesToDisable = @(
    'RemoteRegistry',
    'WinRM',
    'Spooler',
    'TermService',
    'SessionEnv',
    'UmRdpService',
    'RemoteAccess',
    'RpcLocator',
    'Browser',
    'MapsBroker',
    'lfsvc',
    'IISADMIN',
    'irmon',
    'lltdsvc',
    'LxssManager',
    'FTPSVC',
    'MSiSCSI',
    'PNRPsvc',
    'p2psvc',
    'p2pimsvc',
    'PNRPAutoReg',
    'wercplsupport',
    'Wecsvc',
    'WMPNetworkSvc',
    'icssvc',
    'WpnService',
    'PushToInstall',
    'W3SVC',
    'XboxGipSvc',
    'XblAuthManager',
    'XblGameSave',
    'XboxNetApiSvc',
    'SSDPSRV',
    'upnphost',
    'sacsvr',
    'simptcp',
    'SNMP',
    'LanmanServer',
    'WerSvc'
)

foreach ($svc in $servicesToDisable) {
    Disable-ServiceIfNeeded -ServiceName $svc
}

Write-Host "`n✔ Service hardening applied.`n"
