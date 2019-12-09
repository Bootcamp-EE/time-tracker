variable "AWS_ACCESS_KEY" {
}
variable "AWS_SECRET_KEY" {
}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    "us-east-1": "ami-00a208c7cdba991ea"
    "us-west-1": "ami-04c58523038d79132"
  }
}

variable "AWS_AVAILABILITY_ZONE" {
  default = "us-east-1a"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "timesheet_key"
}
variable "TIMESHEET_PUBLIC_KEY" {
}
variable "INSTANCE_USER" {
  default = "ubuntu"
}
