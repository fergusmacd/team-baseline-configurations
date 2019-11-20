resource "github_team_membership" "prospero_team_membership_mononke_bot" {
  team_id  = data.terraform_remote_state.team.outputs.team_id_prospero
  username = data.terraform_remote_state.team.outputs.member_username_mononoke_bot
  role     = "member"
}
