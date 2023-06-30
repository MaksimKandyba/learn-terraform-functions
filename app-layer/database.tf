resource "fly_app" "databaseApp" {
  name = "kandyba-mysql"
  org  = "personal"
}

data "fly_app" "dbApp" {
  name = fly_app.databaseApp.name
  #depends_on = [fly_app.databaseApp]
}
