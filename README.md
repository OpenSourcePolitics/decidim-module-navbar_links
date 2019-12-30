# Decidim::NavbarLinks

[![CircleCI](https://circleci.com/gh/OpenSourcePolitics/decidim-module-navbar_links.svg?style=svg)](https://circleci.com/gh/OpenSourcePolitics/decidim-module-navbar_links)
[![Maintainability](https://api.codeclimate.com/v1/badges/179ba669f18869b0040a/maintainability)](https://codeclimate.com/github/OpenSourcePolitics/decidim-module-navbar_links/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/179ba669f18869b0040a/test_coverage)](https://codeclimate.com/github/OpenSourcePolitics/decidim-module-navbar_links/test_coverage)

## Usage

NavbarLinks adds a custom link to your decidim menu.

Admin view:
![Admin view](https://github.com/OpenSourcePolitics/decidim-module-navbar_links/blob/media/admin.png)

Homepage view:
![Home view](https://github.com/OpenSourcePolitics/decidim-module-navbar_links/blob/media/home.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-navbar_links', git: "https://github.com/OpenSourcePolitics/decidim-module-navbar_links"
```

And then execute:

```bash
$ bundle
$ bundle exec rake decidim_navbar_links:install:migrations
$ bundle exec rake db:migrate
```

## Contributing

See [Decidim](https://github.com/decidim/decidim).

## License

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.
