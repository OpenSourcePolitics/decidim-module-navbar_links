# Decidim::NavbarLinks

[![CircleCI](https://circleci.com/gh/OpenSourcePolitics/decidim-module-navbar_links.svg?style=svg)](https://circleci.com/gh/OpenSourcePolitics/decidim-module-navbar_links)

## Usage

NavbarLinks adds a custom link to your decidim menu.

Admin view:
![Admin view](https://github.com/OpenSourcePolitics/decidim-module-navbar_links/blob/media/admin.png)

Homepage view:
![Home view](https://github.com/OpenSourcePolitics/decidim-module-navbar_links/blob/media/home.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-navbar_links
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
