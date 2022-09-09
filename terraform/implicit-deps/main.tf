# main.tf
terraform {
  required_providers {
  }
}

locals {
  teams = {
    a = {
      content = "hey, I'm a. aaaaaay!"
    },
    b = {
      content = "great team. we change names a lot."
    },
    c = {
      content = "int main () { return 0; }"
    }
  }
}

module "teams" {
  source = "./team"

  for_each = local.teams

  team = each.key
  content = each.value.content
}

resource "local_file" "team_guide" {
  content = join("\n", [for k, v in module.teams : "${k}: ${v.content}"])
  filename = "team_guide.txt"
}