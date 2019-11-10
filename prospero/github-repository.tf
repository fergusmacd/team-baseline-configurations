resource "github_repository" "team_baseline_configurations" {
  name        = "team-baseline-configurations"
  description = "Baselines for all teams - github, teams, members"

  private = false
  has_issues = true
  has_wiki = true
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  auto_init = true
  license_template = "mit"
  topics = ["prospero", "config", "terraform"]
}

resource "github_repository" "terraform_modules" {
  name        = "terraform-modules"
  description = "Terraform modules repo"

  private = false
  has_issues = true
  has_wiki = true
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  auto_init = true
  license_template = "mit"
  topics = ["prospero", "modules", "terraform"]
}

# Protect the master branch of the repository.
resource "github_branch_protection" "team_baseline_config" {
  repository     = "${github_repository.team_baseline_configurations.name}"
  branch         = "master"
  enforce_admins = true

  #required_status_checks {
  #  strict   = false
  #  contexts = ["ci/travis"]
  #}

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    dismissal_teams       = ["${github_team.prospero.slug}"]
    require_code_owner_reviews = false
   # required_approving_review_count = 0
  }

  restrictions {
    teams = ["${github_team.prospero.slug}"]
  }
}

# main prospero team has admin over own repos
resource "github_team_repository" "team_baseline_config_repo" {
  team_id    = "${github_team.prospero.id}"
  repository = "${github_repository.team_baseline_configurations.name}"
  permission = "admin"
}

# main prospero team has admin over own repos
resource "github_team_repository" "terraform_modules_repo" {
  team_id    = "${github_team.prospero.id}"
  repository = "${github_repository.terraform_modules.name}"
  permission = "admin"
}
