# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module NavbarLinks
    # This is the engine that runs on the public interface of navbar_links.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::NavbarLinks

      routes do
        # Add engine routes here
        # resources :navbar_links
        # root to: "navbar_links#index"
      end

      initializer "decidim_navbar_links.assets" do |app|
        app.config.assets.precompile += %w[decidim_navbar_links_manifest.js decidim_navbar_links_manifest.css]
      end

      initializer "decidim.menu" do
        Decidim.menu :menu do |menu|
          current_organization.navbar_links.each do |navbar_link|
            menu.item translated_attribute(navbar_link.title),
                      navbar_link.link,
                      position: 5,
                      active: :exact,
                      target: navbar_link.target
          end
        end
      end
    end
  end
end
