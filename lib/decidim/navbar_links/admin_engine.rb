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
          mount Decidim::NavbarLinks::AdminEngine, at: "/admin", as: "decidim_admin_navbar_links"
        end
      end

      initializer "decidim_navbar_links.admin_assets" do |app|
        app.config.assets.precompile += %w(links_admin_manifest.js)
      end

      def load_seed
        nil
      end
    end
  end
end
