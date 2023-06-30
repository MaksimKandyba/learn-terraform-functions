provider "fly" {
  fly_http_endpoint = "api.machines.dev"
}

provider "random" {}

resource "random_pet" "name" {}

resource "fly_machine" "web" {
  app    = "kandyba-flyiac"
  region = var.fly_region
  name   = random_pet.name.id
  image  = "registry.fly.io/kandyba-flyiac"
  services = [
    {
      ports = [
        {
          port     = 443
          handlers = ["tls", "http"]
        },
        {
          port     = var.external_port
          handlers = ["http"]
        }
      ]
      "protocol" : "tcp",
      "internal_port" : 80
    }
  ]
  cpus     = 1
  memorymb = 256
  env      = var.env_vars
  cmd = [
    "/bin/${var.interpreter}",
    "-c",
    join(
      " ",
      concat(
        ["service httpd start && chkconfig httpd on && echo"],
        slice(var.phrase, 0, var.word_count),
        ["> /var/www/html/tobe.$EXT"]
      )
    )
  ]
  #depends_on = [fly_app.exampleApp]
}

data "terraform_remote_state" "app_layer" {
  backend = "local"

  config = {
    path = "../app-layer/terraform.tfstate"
  }
}
