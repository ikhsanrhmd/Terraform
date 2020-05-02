resource "heroku_app" "ikhsanrhmd35nolsatu" {
  name = "ikhsanrhmd35nolsatu"
  region = "us"
}

resource "heroku_build" "ikhsanrhmd35nolsatu" {
  app = heroku_app.ikhsanrhmd35nolsatu.name
  buildpacks = ["https://github.com/heroku/heroku-buildpack-php"]

  source = {
    url = "https://github.com/ilosaurus/php-getting-started/archive/1.1.2.tar.gz"
    version = "1.1.2"
  }
}
