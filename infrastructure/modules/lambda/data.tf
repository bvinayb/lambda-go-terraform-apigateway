data "archive_file" "this" {
  depends_on = [null_resource.lambda_build]
  for_each   = local.lambdas

  type        = "zip"
  source_file = "${path.module}/lambdas/bin/${each.key}"
  output_path = "${path.module}/lambdas/archive/${each.key}.zip"
}
