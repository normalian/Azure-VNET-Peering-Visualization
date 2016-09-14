# After running this script, you can visualize vnet peering using below Graphviz site.
#   VNET Peering visualization script http://www.webgraphviz.com/

$vnets = Get-AzureRmVirtualNetwork 
Write-Output "digraph finite_state_machine {"
foreach($vnet in $vnets){
    $peering = Get-AzureRmVirtualNetworkPeering -VirtualNetworkName $vnet.Name -ResourceGroupName $vnet.ResourceGroupName
    if( $peering -ne $null ){
        foreach($remoteVNet in $peering.RemoteVirtualNetwork){
            # extract vnet name from resource id
            $msg = "`t`"" + $vnet.Name + "`" -> `"" + $remoteVNet.Id.Split("/")[8] + "`";"
            Write-Output $msg
        }
    }else{
        $msg = "`t`"" + $vnet.Name + "`";"
        Write-Output $msg
    }
}
Write-Output "}"