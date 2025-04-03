variable vpc_cidr_out {
  type        = string
  default     = "10.0.0.0/16"
  description = "description"
}

variable public_subnet_1_out {
  type        = string
  default     = "10.0.1.0/24"
  description = "description"
}

variable public_az_1_out {
  type        = string
  default     = "ap-south-1a"
  description = "description"
}

variable public_subnet_2_out {
  type        = string
  default     = "10.0.2.0/24"
  description = "description"
}

variable public_az_2_out {
  type        = string
  default     = "ap-south-1b"
  description = "description"
}

variable private_subnet_1_out {
  type        = string
  default     = "10.0.3.0/24"
  description = "description"
}

variable private_az_1_out {
  type        = string
  default     = "ap-south-1a"
  description = "description"
}

variable private_subnet_2_out {
  type        = string
  default     = "10.0.4.0/24"
  description = "description"
}

variable private_az_2_out {
  type        = string
  default     = "ap-south-1b"
  description = "description"
}

# ======== EC2 ============ #

variable ami_id_out {
  type        = string
  default     = "ami-01bd9d8f06d29d6a0"
  
}

variable instance_type_id_out {
  type        = string
  default     = "t2.micro"
  description = "description"
}


# ============ DB =============== #

variable db_username_out {
  type        = string
  default     = "admin"
  description = "description"
}

variable db_password_out {
  type        = string
  default     = "Admin123"
  sensitive = true
  description = "description"
}

variable db_az_out {
  type        = string
  default     = "ap-south-1a"
  description = "description"
}


# ========= ELB ============ 

variable load_balan_type_out {
  type        = string
  default     = "application"
  description = "description"
}

