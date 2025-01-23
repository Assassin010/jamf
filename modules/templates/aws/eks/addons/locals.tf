locals {
  addons = [
    for addon in var.addons : {
      addon_name               = addon.addon_name
      addon_version            = lookup(addon, "addon_version", "")
      service_account_role_arn = lookup(addon, "service_account_role_arn", "")
    }
  ]
}
