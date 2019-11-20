data "terraform_remote_state" "team" {
  backend = "remote"

  config = {
    organization = "mononoke"
    workspaces = {
      name = "organization-admin"
    }
  }
}
