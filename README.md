# VNET peering visualization with GraphViz
This powershell script output graphviz data of your VNET peerings. You can visualize VNET peerings in your subscriptions with Graphviz like below.
![VNet Peering visualization](https://raw.githubusercontent.com/normalian/Azure-VNET-Peering-Visualization/master/VNetPeerVisualize.png "VNet Peering visualization")

## Reference
- WebGraphviz http://www.webgraphviz.com/
- Graphviz http://www.graphviz.org/

## Restriction
- You can't visualize connections from classic-vnets to arm-vnet. Because Get-AzureRmVirtualNetwork command can't get the data.

## Copyright
<table>
  <tr>
    <td>Copyright</td><td>Copyright (c) 2016- Daichi Isami</td>
  </tr>
  <tr>
    <td>License</td><td>Eclipse Public License - v 1.0</td>
  </tr>
</table>
