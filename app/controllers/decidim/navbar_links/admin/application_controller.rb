# frozen_string_literal: true

module Decidim
  module NavbarLinks
    module Admin
      # This controller is the abstract class from which all other controllers of
      # this engine inherit.
      #
      # Note that it inherits from `decidim::admin::Components::BaseController`, which
      # override its layout and provide all kinds of useful methods.
      class ApplicationController < Decidim::Admin::ApplicationController
        def permission_class_chain
          [Decidim::NavbarLinks::Admin::Permissions] + super
        end
      end
    end
  end
end
