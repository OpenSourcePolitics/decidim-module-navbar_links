# frozen_string_literal: true

module Decidim
  module NavbarLinks
    module Admin
      # A command with all the business logic when updating a navbar link.
      class UpdateNavbarLink < Decidim::Command
        # Public: Initializes the command.
        #
        # form - A form object with the params.
        def initialize(form, navbar_link)
          @form = form
          @navbar_link = navbar_link
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid.
        # - :invalid if the form wasn't valid and we couldn't proceed.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if form.invalid?

          update_navbar_link
          broadcast(:ok)
        end

        private

        attr_reader :form

        def update_navbar_link
          @navbar_link.update!(attributes)
        end

        def attributes
          {
            title: form.title,
            link: form.link,
            weight: form.weight,
            target: form.target,
            organization: form.organization
          }
        end
      end
    end
  end
end
