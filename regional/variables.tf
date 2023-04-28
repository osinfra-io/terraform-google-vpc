# Input Variables
# https://www.terraform.io/language/values/variables

variable "project_id" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "secondary_ranges" {
  description = "An array of configurations for secondary IP ranges for VM instances contained in this subnetwork"
  type        = map(any)
  default     = {}
}

variable "subnets" {
  description = "The map of subnets being created"
  type = map(object({
    network                  = string
    range                    = string
    region                   = string
    private_ip_google_access = optional(string)
    purpose                  = optional(string)
    role                     = optional(string)
  }))
}
