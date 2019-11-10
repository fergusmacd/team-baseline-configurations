# Configure the GitHub Provider
provider "github" {
  version = "~> 2.2"
  organization = "${var.organization}"
  # Set GITHUB_TOKEN as an environment variable
}
