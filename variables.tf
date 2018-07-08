variable "loc" {
  description = "Default Azure Region"
  default     = "West Europe"
}

variable "tags" {
  default = {
    source = "citadel"
    env    = "training"
  }
}

variable "tenant_id" {
  description = "Tenant ID for Azure AD Directory/Tenant"
  default     = "72f988bf-86f1-41af-91ab-2d7cd011db47"
}

variable "kvr_object_id" {
  default = "7d5e4914-4b01-445d-8da9-1ebce1d35715"
}
