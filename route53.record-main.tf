
/*
 | --
 | -- This data source is a lookup that finds the hosted zone IDs
 | -- froma the input list of known DNS names.
 | --
*/
data aws_route53_zone selected {
    count = length( var.in_zone_names )
    name = var.in_zone_names[ count.index ]
    private_zone = false
}


/*
 | --
 | -- Marry the http variant of the input dns names to the lesser
 | -- known input urls (usually load balancer urls) list.
 | --
*/
resource aws_route53_record http {

    count = length( var.in_dns_names )

    zone_id = element( data.aws_route53_zone.selected.*.zone_id, count.index )
    name    = var.in_dns_names[ count.index ]
    type    = "CNAME"
    ttl     = "300"
    records = [ element( var.in_dns_urls, count.index ) ]

}


/*
 | --
 | -- Marry the https variant of the input dns names to the lesser
 | -- known input urls (usually load balancer urls) list.
 | --
*/
resource aws_route53_record ssl {

    count = length( var.in_dns_names )

    zone_id = element( data.aws_route53_zone.selected.*.zone_id, count.index )
    name    = "https://${ var.in_dns_names[ count.index ] }"
    type    = "CNAME"
    ttl     = "300"
    records = [ element( var.in_dns_urls, count.index ) ]

}

