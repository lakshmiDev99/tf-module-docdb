resource "aws_docdb_subnet_group" "main" {
  name       = "${local.name_prefix}-subnet-group"
  subnet_ids = var.subnet_ids
  tags               = merge(local.tags, { Name = "${local.name_prefix}-subnet-group" })
}


resource "aws_docdb_cluster" "main" {
  cluster_identifier      = "${local.name_prefix}-cluster"
  engine                  = "docdb"
  master_username         = data.aws_ssm_parameter.master_username.value
  master_password         = data.aws_ssm_parameter.master_password.value
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = var.skip_final_snapshot
}

