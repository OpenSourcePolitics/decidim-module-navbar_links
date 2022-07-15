# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION
DECIDIM_VERSION = { github: "decidim/decidim", branch: "develop" }.freeze

gem "decidim", DECIDIM_VERSION
gem "decidim-navbar_links", path: "."

gem "bootsnap"
gem "uglifier", "~> 4.1"

group :development, :test do
  gem "faker", "~> 2.18"

  gem "decidim-dev", DECIDIM_VERSION
  gem "rubocop-performance"
  gem "simplecov", require: false
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end

group :test do
  gem "rubocop-faker"
end