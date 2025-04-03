module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr_out
    public_subnet_1_in = var.public_subnet_1_out
    public_az_1_in = var.public_az_1_out
    public_subnet_2_in = var.public_subnet_2_out
    public_az_2_in = var.public_az_2_out
    private_subnet_1_in = var.private_subnet_1_out
    private_az_1_in = var.private_az_1_out
    private_subnet_2_in = var.private_subnet_2_out
    private_az_2_in = var.private_az_2_out
}

module "ec2" {
    source = "./modules1/ec2"
    ami_id = var.ami_id_out
    instance_type_id = var.instance_type_id_out
    public_subnet_11 = module.vpc.public_subnet_1_output
    public_subnet_22 = module.vpc.public_subnet_2_output 
    public_sec_grp = module.vpc.public_sg_output
}

module "db" {
    source = "./modules2/db"
    db_username = var.db_username_out
    db_password = var.db_password_out
    db_az = var.db_az_out
    private_sg_db = module.vpc.private_sg_output
    private_subnet_1_db = module.vpc.private_subnet_1_output
    private_subnet_2_db = module.vpc.private_subnet_2_output
}

module "elb" {
    source = "./modules3/elb"
    load_balan_type = var.load_balan_type_out
    public_sg_elb = module.vpc.public_sg_output
    public_subnet_1_elb = module.vpc.public_subnet_1_output
    public_subnet_2_elb = module.vpc.public_subnet_2_output
    vpc_elb = module.vpc.vpc_output
    web_1_elb = module.ec2.web_1_output
    web_2_elb = module.ec2.web_2_output

}