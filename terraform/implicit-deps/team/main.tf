# team/main.tf
variable "team" {
  type = string
}

variable "summary" {
  type = string
}

resource "local_file" "team_data" {
  content = var.summary
  filename = "${var.team}.data"
}

output "content" {
  value = local_file.team_data.content
}