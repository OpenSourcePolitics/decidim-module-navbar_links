module Decidim
  module NavbarLinks
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          if user&.admin? && permission_action.scope == :admin && permission_action.subject == :navbar_link
            allow!
            return permission_action
          end

          disallow!
          permission_action
        end
      end
    end
  end
end
