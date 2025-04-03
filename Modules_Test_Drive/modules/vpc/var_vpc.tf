variable vpc_cidr {
  type        = string
  # default     = "10.0.0.0/16"
}

variable public_subnet_1_in {
  type        = string
  # default     = "10.0.1.0/24"
}

variable public_az_1_in {
  type        = string
  # default     = "ap-south-1a"
  
}

variable public_subnet_2_in {
  type        = string
  # default     = "10.0.2.0/24"
}

variable public_az_2_in {
  type        = string
  # default     = "ap-south-1b"
}


variable private_subnet_1_in {
  type        = string
  # default     = "10.0.3.0/24"

}

variable private_az_1_in {
  type        = string
  # default     = "ap-south-1a"
}

variable private_subnet_2_in {
  type        = string
  # default     = "10.0.4.0/24"

}

variable private_az_2_in {
  type        = string
  # default     = "ap-south-1a"
}


