# locals {
#   assoc_subnet_rt = {
#     spoke1 = {
#       subnet_id      = module.nw_virtual.subnet_ids["spoke1_app"]
#       route_table_id = module.rt_spoke.route_table_ids["spoke1_rt"]
#     }

#     spoke2 = {
#       subnet_id      = module.nw_virtual.subnet_ids["spoke2_app"]
#       route_table_id = module.rt_spoke.route_table_ids["spoke2_rt"]
#     }
#   }
# }
