# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :navbar_link, class: "Decidim::NavbarLinks::NavbarLink" do
    organization
    title { generate_localized_title }
    link { Faker::Internet.url }
    target { ["blank", ""].sample }
    weight { (1..10).to_a.sample }
  end
end
