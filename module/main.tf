locals {
  map_routes = [
    for pair in var.add_routes : {
      route_table_id = pair[0]
      cidr_block     = pair[1]
    }
  ]
}

resource "aws_route" "add-routes-to-TransitGatway" {
  for_each = {
    for pair in local.map_routes : "${pair.route_table_id}_${pair.cidr_block}" => pair
  }
  route_table_id         = each.value["route_table_id"]
  destination_cidr_block = each.value["cidr_block"]
  transit_gateway_id     = var.tgw_id
}
