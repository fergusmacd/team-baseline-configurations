# Configure the Terraform Enterprise Provider
provider "tfe" {
  hostname = "${var.hostname}"
}

# Create an organization
resource "tfe_organization" "default" {
  name                     = "mononoke"
  email                    = "fergusmacdermot@gmail.com"
  collaborator_auth_policy = "two_factor_mandatory"
  session_timeout_minutes  = 120
  session_remember_minutes = 20160
}
