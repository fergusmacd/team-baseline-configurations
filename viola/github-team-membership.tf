resource "github_team_membership" "team_membership_mononoke_bot" {
  team_id  = data.terraform_remote_state.team.outputs.team_id_viola
  username = data.terraform_remote_state.team.outputs.member_username_mononoke_bot
  role     = "member"
}
