resource "github_team_membership" "prospero_team_membership_mononke_bot" {
  team_id  = "${github_team.prospero.id}"
  username = "${github_membership.membership_mononoke_bot.username}"
  role     = "member"
}
