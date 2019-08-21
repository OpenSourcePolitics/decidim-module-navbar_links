module OrganizationExtend
  extend ActiveSupport::Concern

  included do
    has_many :navbar_links, class_name: "Decidim::NavbarLinks::NavbarLink", foreign_key: "decidim_organization_id", dependent: :destroy
  end
end

Decidim::Organization.class_eval do
  include OrganizationExtend
end
