# frozen_string_literal: true

module Decidim
  module NavbarLinks
    module Admin
      # A form object to create or update scopes.
      class NavbarLinkForm < Form
        include TranslatableAttributes

        translatable_attribute :title, String
        attribute :link, String
        attribute :weight, Integer
        attribute :target, String

        validates :link, format: { with: URI::DEFAULT_PARSER.make_regexp(%w(http https)) }, presence: true
        validates :title, translatable_presence: true
        validates :weight, presence: true

        alias organization current_organization
      end
    end
  end
end
