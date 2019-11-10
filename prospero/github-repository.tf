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
  topics = ["propero", "config"]
}

# Protect the master branch of the repository.
resource "github_branch_protection" "tools_config" {
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
    require_code_owner_reviews = true
    required_approving_review_count = 1
  }

  restrictions {
    teams = ["${github_team.prospero.slug}"]
  }
}

# main prospero team has admin over own repos
resource "github_team_repository" "tools_config_repo" {
  team_id    = "${github_team.prospero.id}"
  repository = "${github_repository.team_baseline_configurations.name}"
  permission = "admin"
}
