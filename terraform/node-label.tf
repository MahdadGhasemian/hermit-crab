# Set Lables to Nodes
resource "null_resource" "label" {
  for_each = var.node_labels

  provisioner "local-exec" {
    command = <<-EOT
      kubectl label node ${each.key} ${join(" ", [for k, v in each.value : "${k}=${v}"])}
    EOT
  }
}
