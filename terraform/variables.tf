variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "tech-challenge-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}