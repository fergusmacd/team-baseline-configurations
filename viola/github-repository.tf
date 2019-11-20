resource "github_repository" "events_website" {
  name        = "events-website"
  description = "The website repo"

  private            = false
  has_issues         = true
  has_wiki           = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  auto_init          = true
  license_template   = "mit"
  topics             = ["viola", "website", "java"]
}

# Protect the master branch of the repository.
resource "github_branch_protection" "events_website" {
  repository     = "${github_repository.events_website.name}"
  branch         = "master"
  enforce_admins = true

  required_status_checks {
    strict   = false
    contexts = ["atlas/mononoke/team-viola"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    dismissal_teams            = ["${data.terraform_remote_state.team.outputs.team_slug_viola}"]
    require_code_owner_reviews = false
    # required_approving_review_count = 0
  }

  restrictions {
    teams = ["${data.terraform_remote_state.team.outputs.team_slug_viola}"]
  }
}

# team has admin over own repos
resource "github_team_repository" "events_website" {
  team_id    = "${data.terraform_remote_state.team.outputs.team_id_viola}"
  repository = "${github_repository.events_website.name}"
  permission = "admin"
}
