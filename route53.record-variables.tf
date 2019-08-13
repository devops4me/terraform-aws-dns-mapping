
### ####################### ###
### [[variable]] in_ingress ###
### ####################### ###

variable in_dns_names {

    description = "A list of DNS names that are positioned in Route53 with a lookable up zone ID."
    type        = "list"
}


### ######################## ###
### [[variable]] in_dns_urls ###
### ######################## ###

variable in_dns_urls {

    description = "Usually a list of load balancer front-end urls to unite with the names."
    type        = "list"
}
