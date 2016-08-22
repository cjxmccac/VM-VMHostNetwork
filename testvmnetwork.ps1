<#
    Get all hosts and move the specified VM to each host
#>
$vcenter = "GAM-VCENTER-01.grcadvantage.com"
$vmname = "GAM-TEST-01"

Connect-VIserver $vcenter
$hosts = Get-VMHost | where {$_.PowerState -eq "PoweredOn" }
$vm = Get-VM -Name $vmname
foreach ($objHost in $hosts) {
    Move-VM -VM $vm -Destination (Get-VMHost $objHost.name)
    Start-Sleep -Seconds 8
}
# Get-VM -Location "HostName" | Move-VM -Destination (Get-Vmhost "NewHost")