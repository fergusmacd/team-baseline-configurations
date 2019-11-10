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