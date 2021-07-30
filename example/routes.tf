locals {
    ### TGW Routes
  routes_to_tgw = ["172.17.56.0/25","172.17.152.0/22", "192.168.0.0/16", "172.17.211.0/24"]
  add_routes    = setproduct(sort(tolist(data.aws_route_tables.all_rts.ids)), local.routes_to_tgw)


}


########################################
##### Add routes to TGW 

module "add_tgw_routes" {
  source                             = "../modules/tgw_routes"
  
  tgw_id                             = local.tgw_id
  add_routes                         = local.add_routes

}