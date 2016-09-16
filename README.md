# VNET and VPN peering visualization with GraphViz
This powershell script output graphviz data of your VNET peerings and VPN peering. You can visualize VNET peerings in your subscriptions with Graphviz like below(red lines are VPN peerings, black lines are vnet peerings).
![VNet Peering visualization](https://raw.githubusercontent.com/normalian/Azure-VNET-Peering-Visualization/master/VNetPeerVisualize.png "VNet Peering visualization")

## Reference
- WebGraphviz http://www.webgraphviz.com/
- Graphviz http://www.graphviz.org/

## Restriction
- You can't visualize connections from classic-vnets to arm-vnets. Because Get-AzureRmVirtualNetwork command can't get the data.

## Copyright
<table>
  <tr>
    <td>Copyright</td><td>Copyright (c) 2016- Daichi Isami</td>
  </tr>
  <tr>
    <td>License</td><td>MIT License</td>
  </tr>
</table>
