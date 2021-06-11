# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module NavbarLinks
    # This is the engine that runs on the public interface of navbar_links.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::NavbarLinks

      initializer "decidim.menu" do
        Decidim.menu :menu do |menu|
          NavbarLink.organization(current_organization).ordered.each do |navbar_link|
            menu.add_item :navbar,
                          translated_attribute(navbar_link.title),
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
