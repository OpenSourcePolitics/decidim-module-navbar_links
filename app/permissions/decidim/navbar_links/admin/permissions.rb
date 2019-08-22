# frozen_string_literal: true

module Decidim
  module NavbarLinks
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          if permission_action.subject == :navbar_link
            if permission_action.scope == :admin && user&.admin?
              allow!
            else
              disallow!
            end
          end

          permission_action
        end
      end
    end
  end
end
