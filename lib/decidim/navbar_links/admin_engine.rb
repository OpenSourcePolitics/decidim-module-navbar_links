# frozen_string_literal: true

module Decidim
  module NavbarLinks
    # This is the engine that runs on the public interface of `NavbarLinks`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::NavbarLinks::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :navbar_links do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "navbar_links#index"
      end

      def load_seed
        nil
      end
    end
  end
end
