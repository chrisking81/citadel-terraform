variable "loc" {
  description = "Default Azure Region"
  default     = "westeurope"
}

variable "webapplocs" {
  type    = "list"
  default = []
}

variable "tags" {
  default = {
    source = "citadel"
    env    = "training"
  }
}

variable "tenant_id" {
  description = "Tenant ID for Azure AD Directory/Tenant"
  default     = ""
}

variable "kvr_object_id" {
  description = "Object ID for SPN"
}
