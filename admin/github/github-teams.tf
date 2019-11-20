resource "github_team" "prospero" {
  name        = "prospero"
  description = "Team responsible for building out infrastructure changes and building developer tools."
  privacy     = "closed"
}

resource "github_team" "viola" {
  name        = "viola"
  description = "Team responsible for building out back end services and web sites."
  privacy     = "closed"
}
