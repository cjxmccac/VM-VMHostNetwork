<#
    Get all hosts and move the specified VM to each host
#>
$vcenter = "GAM-VCENTER-01.grcadvantage.com"
$cluster = "LBC Gaming Cluster"
$vmname = "LBC-GAMTEST-01"

Connect-VIserver $vcenter
$hosts = Get-Cluster -Name $cluster | Get-VMHost | where {$_.PowerState -eq "PoweredOn" }
$vm = Get-VM -Name $vmname
foreach ($objHost in $hosts) {
    Move-VM -VM $vm -Destination (Get-VMHost $objHost.name)
    echo $objHost.name
    Start-Sleep -Seconds 8
}