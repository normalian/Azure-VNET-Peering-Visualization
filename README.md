# VNET and VPN peering visualization with GraphViz
This PowrShell script output graphviz data of your VNET peerings and VPN peering. You can visualize components connecting to your VNETs in your subscription with Graphviz like below(red lines are VPN peerings, black lines are VNET peerings, green circle is WebApps and yellow circle is Azure Redis Cache).
![VNet Peering visualization](https://raw.githubusercontent.com/normalian/Azure-VNET-Peering-Visualization/master/VNetPeerVisualize.png "VNet Peering visualization")

This PowrShell script supports to visualize components sucha as VNET peerings, VPN peerings, WebApps VPN peerings and Azure Redis Cache.

## Reference
- WebGraphviz http://www.webgraphviz.com/
- Graphviz http://www.graphviz.org/

## Restriction
- You can't visualize connections from classic-vnets to arm-vnets. Because Get-AzureRmVirtualNetwork command can't get the data.
- You can't visualize connections of WebApps deployment slots.

## Copyright
<table>
  <tr>
    <td>Copyright</td><td>Copyright (c) 2016- Daichi Isami</td>
  </tr>
  <tr>
    <td>License</td><td>MIT License</td>
  </tr>
</table>
