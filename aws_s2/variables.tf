variable "deploymentid" {
  type    = string
  default = "1"
  description = "Deployment ID"
}

variable "tags" {
  type = map
  default = null
  description = "Default tags"
}