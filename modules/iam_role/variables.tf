variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy for the IAM role"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM role policy"
  type        = string
}

variable "policy" {
  description = "The policy document for the IAM role"
  type        = string
}
