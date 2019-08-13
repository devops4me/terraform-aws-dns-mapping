
# Marrying DNS Names | Route53 Terraform Module

Like a priest uniting a line of brides and a line of grooms in holy matrimony, this module brings together a list of dns names with a list of (url) names.

It requires **3 input lists** to do its work. These are
- the list of (period-suffixed) AWS hosted zone names
- the list of human known dns names
- the list of just created load balancer urls


Usually the first input list comprises of known DNS names and the second are load balancer urls that have just been provisioned. This module works the two lists, and the unification is a route53 record set.

## http and https names

This module will map both the http and https variant of the DNS name. Best practice is to configure the load balancer so that it redirects any http (port 80) requests to the https/tls variant on port 443.

## Input Variables

| Variable Name | Type | Mandatory | Comment |
|:-------- |:---- |:-------:|:------- |
**in_zone_names** | List | Yes | The list of hosted zone names ending with a period (dot)
**in_dns_names** | List | Yes | The list of dns names within the Route53 hosted zones
**in_dns_urls** | List | Yes | The list of front end load balancer url names

## Example Input Lists

By way of example these 3 lists can be provided.

| Variable Name   | Example List Contents |
|:--------------- |:--------------------- |
**in_zone_names** | "joebloggs.com.", "joebloggs.com.", "peterpan.com."
**in_dns_names**  | "test.joebloggs.com", "lab.joebloggs.com", "canary.peterpan.com"
**in_dns_urls**   | "xyz...amazonaws.com", "pqr...amazonaws.com", "abc...amazonaws.com"
