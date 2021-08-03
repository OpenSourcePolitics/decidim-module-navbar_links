# frozen_string_literal: true

module Decidim
  module NavbarLinks
    # This is the engine that runs on the public interface of `NavbarLinks`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::NavbarLinks::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        resources :navbar_links
        root to: "navbar_links#index"
      end

      initializer "decidim_navbar_links.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::NavbarLinks::AdminEngine, at: "/admin", as: :decidim_admin_navbar_links
        end
      end

      initializer "decidim_navbar_links.view_hooks" do
        Decidim.menu :admin_settings_menu do |menu|
          menu.add_item :navbar_links,
                        t("menu.navbar_links", scope: "decidim_navbar_links.admin"),
                        decidim_admin_navbar_links.navbar_links_path,
                        position: 1.25,
                        active: is_active_link?(decidim_admin_navbar_links.navbar_links_path),
                        if: allowed_to?(:update, :organization, organization: current_organization)
        end
      end

      def load_seed
        nil
      end
    end
  end
end
