module Decidim
  module NavbarLinks
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          return permission_action unless user
          return permission_action unless permission_action.scope == :admin

          if user.admin?
            allow! if permission_action.subject == :navbar_link
          end

          permission_action
        end
      end
    end
  end
end
