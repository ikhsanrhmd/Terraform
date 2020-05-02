resource "heroku_app" "ikhsanrhmd35nolsatuquiz" {
  name = "ikhsanrhmd35nolsatuquiz"
  region = "us"
}

resource "heroku_build" "ikhsanrhmd35nolsatuquiz" {
  app = heroku_app.ikhsanrhmd35nolsatuquiz.name
  buildpacks = ["https://github.com/heroku/heroku-buildpack-php"]

  source = {
    url = "https://github.com/ilosaurus/php-getting-started/archive/1.1.2.tar.gz"
    version = "1.1.2"
  }
}

