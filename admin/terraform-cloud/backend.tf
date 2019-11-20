terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "mononoke"

    workspaces {
      name = "tc-admin"
    }
  }

}
