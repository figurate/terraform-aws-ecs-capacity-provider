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

variable "on_demand_base_capacity" {
  description = "Minimum number of on-demand instances used to fulfill desired capacity"
  default     = 0
}

variable "on_demand_percentage_above_base_capacity" {
  description = "Percentage of on-demand vs spot instances"
  default     = 0
}
