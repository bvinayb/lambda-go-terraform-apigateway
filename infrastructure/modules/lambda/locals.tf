locals {
  main_module_name = split(".terraform/modules/", path.module)[1]
  main_module_path = "./.terraform/modules/${local.main_module_name}"

  lambdas = {
    find_or_create_user = {
      description = "Triggers find or create user handler"
      timeout     = 15
    }
  }

  null_r = {
    lambda_binary_exists = { for key, _ in local.lambdas : key => fileexists("${path.module}/lambdas/bin/${key}") }
  }
}
