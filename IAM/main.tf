module "iam_policies" {
  source = "./modules/iam_policies"
  
  policies = var.policies
}

module "iam_roles" {
  source = "./modules/iam_roles"
  depends_on = [module.iam_policies]
  
  roles = var.roles
}

module "iam_groups" {
  source = "./modules/iam_groups"
  depends_on = [module.iam_policies]
  
  groups = var.groups
}

module "iam_users" {
  source = "./modules/iam_users"
  depends_on = [module.iam_groups, module.iam_policies]
  
  users = var.users
}