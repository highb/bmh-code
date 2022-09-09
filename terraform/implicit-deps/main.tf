# main.tf

locals {
  teams = {
    a = {
      summary = "hey, I'm a. aaaaaay!"
    },
    b = {
      summary = "great team. we change names a lot. weekly, at least."
    },
    c = {
      summary = "int main () { return 0; }"
    }
  }
}

module "teams" {
  source = "./team"

  for_each = local.teams

  team = each.key
  summary = each.value.summary
}

resource "local_file" "team_guide" {
  content = join("\n", [for k, v in module.teams : join(": ", [k, v.content])])
  filename = "team_guide.txt"
}