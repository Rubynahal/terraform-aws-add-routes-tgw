# terraform-aws-add-routes-tgw
This module allows to supply a list of routes to add to the vpc route table that point to transit gateway


Using this module, routes are not re-created when a new route is added to list of destination CIDRs. It honors the order of the routes. 