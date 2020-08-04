variable "name" {
  description = "Name of the capacity provider"
}

variable "launch_template" {
  description = "Identifier of Launch Template used for auto-scaling"
}

variable "vpc_default" {
  description = "Indicate whether to deploy in the default VPC"
  default     = true
}

variable "vpc_tags" {
  type        = map(any)
  description = "A map of tags to match on the VPC lookup"
  default     = {}
}

variable "asg_max_size" {
  description = "Maximum allowed nodes in the cluster"
  type        = number
  default     = 3
}
