# frozen_string_literal: true

module Decidim
  module NavbarLinks
    # This is the engine that runs on the public interface of `NavbarLinks`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::NavbarLinks::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        resources :links
        root to: "links#index"
      end

      initializer "decidim_navbar_links.admin_mount_routes" do
        Decidim::Core::Engine.routes do
          mount Decidim::NavbarLinks::AdminEngine, at: "/admin/navbar_links", as: "decidim_admin_navbar_links"
        end
      end

      initializer "decidim_navbar_links.admin_assets" do |app|
        app.config.assets.precompile += %w(links_admin_manifest.js)
      end

      initializer "decidim_navbar_links.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.item I18n.t("menu.links", scope: "decidim.navbar_links"),
                    decidim_admin_navbar_links.links_path,
                    icon_name: "wrench",
                    position: 7.1,
                    active: :inclusive,
                    if: allowed_to?(:update, :organization, organization: current_organization)
        end
      end

      def load_seed
        nil
      end
    end
  end
end
