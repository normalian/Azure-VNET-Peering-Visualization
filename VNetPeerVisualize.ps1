# After running this script, you can visualize vnet peering using below Graphviz site.
#   VNET Peering visualization script http://www.webgraphviz.com/

$webappsColor = "`"[color=`"0.408 0.498 1.000`"]"
$vpnPeeringColor = "`"[color=`"0.000 1.000 1.000`"]"

Write-Output "digraph finite_state_machine {"
Write-Output "`tnode [style=filled]";

# Web Apps VPN Peering
$webapps = Get-AzureRmWebApp 
foreach( $webapp in $webapps ){
    $vnets = Get-AzureRmVirtualNetwork    
    foreach( $vnet in $vnets ){
        try{
            $resourceName = $webapp.SiteName + "/" + $vnet.Name
            $webappVpnPeering = Get-AzureRmResource -ResourceGroupName $webapp.ResourceGroup -ResourceType "Microsoft.Web/sites/virtualNetworkConnections" -ResourceName $resourceName -ApiVersion 2016-03-01
            $msg = "`t`"" + $webapp.SiteName + $webappsColor + ";"
            Write-Output $msg
            $msg = "`t`"" + $webapp.SiteName + "`" -> `"" + $vnet.Name + $vpnPeeringColor + ";"
            Write-Output $msg
        }catch [Exception]{
            # no output. There is no way to find VNET and WebApps peering except for this way.
        }
    }
}


# VNET Peering visualize
$vnets = Get-AzureRmVirtualNetwork
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


# VNET VPN Peering visualize
$rgs = Get-AzureRmResourceGroup
foreach( $rg in $rgs ){
    $conns = Get-AzureRmVirtualNetworkGatewayConnection -ResourceGroupName $rg.ResourceGroupName
    foreach( $conn in $conns ){
        $gateway1Text = $conn.VirtualNetworkGateway1Text.Replace('"','')
        $rg1 = $gateway1Text.Split("/")[4]
        $gateway1 = $gateway1Text.Split("/")[8]
        $vnet1 = (Get-AzureRmVirtualNetworkGateway -Name $gateway1 -ResourceGroupName $rg1).IpConfigurations.Subnet.Id.Split("/")[8]

        $gateway2Text = $conn.VirtualNetworkGateway2Text.Replace('"','')
        $rg2 = $gateway2Text.Split("/")[4]
        $gateway2 = $gateway2Text.Split("/")[8]
        $vnet2 = (Get-AzureRmVirtualNetworkGateway -Name $gateway2 -ResourceGroupName $rg2).IpConfigurations.Subnet.Id.Split("/")[8]

        $msg = "`t`"" + $vnet1 + "`" -> `"" + $vnet2 + $vpnPeeringColor + ";"
        Write-Output $msg
    }
}

Write-Output "}"
