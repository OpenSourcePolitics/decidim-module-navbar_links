# frozen_string_literal: true

module Decidim
  module NavbarLinks
    class NavbarLink < ApplicationRecord
      belongs_to :organization, foreign_key: "decidim_organization_id", class_name: "Decidim::Organization"
      scope :organization, ->(organization) { where(organization: organization) }
      scope :ordered, -> { order(:weight)}

      before_save :validate_link_regex

      def validate_link_regex
        link = URI.parse(self.link)
        link&.host
      rescue URI::InvalidURIError
        errors.add(:link)
      end
    end
  end
end
