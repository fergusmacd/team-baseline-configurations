# teams here
output "team_slug_prospero" {
  value = "${github_team.prospero.slug}"
}

output "team_id_prospero" {
  value = "${github_team.prospero.id}"
}

output "team_slug_viola" {
  value = "${github_team.viola.slug}"
}

output "team_id_viola" {
  value = "${github_team.viola.id}"
}

## members below here
output "member_username_mononoke_bot" {
  value = "${github_membership.mononoke_bot.username}"
}
