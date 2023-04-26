variable "network_name" {
  description = "Name of the network to create"
  type        = string
  default     = "osinfra-vpc"
}

variable "project" {
  description = "The ID of the project in which the resource belongs"
}

variable "rules" {
  description = "List of firewall rule definitions"
  type = list(object({
    allow = optional(list(object({
      ports    = list(string)
      protocol = string
    })), [])

    deny = optional(list(object({
      ports    = list(string)
      protocol = string
    })), [])

    description         = optional(string, null)
    direction           = string
    log_config_enabled  = optional(bool, true)
    log_config_metadata = optional(string, "INCLUDE_ALL_METADATA")
    name                = string
    priority            = optional(number, null)
    ranges              = optional(list(string), null)
    source_tags         = optional(list(string), null)
    target_tags         = optional(list(string), null)
  }))
  default = []
}

variable "shared_vpc" {
  description = "Enable VPC sharing"
  type        = bool
  default     = false
}
