# team/main.tf
variable "team" {
  type = string
}

variable "content" {
  type = string
}

resource "local_file" "contact_point" {
  content = var.content
  filename = "${var.team}.contact"
}

output "content" {
  value = local_file.contact_point.content
}