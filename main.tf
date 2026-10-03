module "networking" {
  source = "./modules/networking"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "compute" {
  source = "./modules/compute"

  vpc_id           = module.networking.vpc_id
  public_subnet_id = module.networking.public_subnet_id
  instance_type    = var.instance_type

  depends_on = [
    module.networking
  ]
}
