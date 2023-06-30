provider "fly" {
  fly_http_endpoint = "api.machines.dev"
}

#resource "fly_app" "exampleApp" {
#  name = "kandyba-flyiac"
#  org  = "personal"
#}

resource "fly_ip" "exampleIp" {
  app  = "kandyba-flyiac"
  type = "v4"
  #depends_on = [fly_app.exampleApp]
}
