variable "loc" {
  description = "Default Azure Region"
  default     = "westeurope"
}

variable "webapplocs" {
  type    = "list"
  default = ["westeurope", "northeurope", "uksouth", "ukwest"]
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
  default = "db323304-8069-4a1c-93f1-8662ec99b11f"
}
