resource "github_repository" "team_baseline_configurations" {
  name        = "team-baseline-configurations"
  description = "Baselines for all teams - github, teams, members"

  private            = false
  has_issues         = true
  has_wiki           = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  auto_init          = true
  license_template   = "mit"
  topics             = ["prospero", "config", "terraform"]
}

# Protect the master branch of the repository.
resource "github_branch_protection" "team_baseline_config" {
  repository     = "${github_repository.team_baseline_configurations.name}"
  branch         = "master"
  enforce_admins = true

  required_status_checks {
    strict = false
    contexts = ["atlas/mononoke/team-prospero",
    "atlas/mononoke/organization-admin", ]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    dismissal_teams            = ["${data.terraform_remote_state.team.outputs.team_slug_prospero}"]
    require_code_owner_reviews = false
    # required_approving_review_count = 0
  }

  restrictions {
    teams = ["${data.terraform_remote_state.team.outputs.team_slug_prospero}"]
  }
}

# main prospero team has admin over own repos
resource "github_team_repository" "team_baseline_config_repo" {
  team_id    = "${data.terraform_remote_state.team.outputs.team_id_prospero}"
  repository = "${github_repository.team_baseline_configurations.name}"
  permission = "admin"
}
