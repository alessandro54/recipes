# frozen_string_literal: true

module Shared
  module Layout
    module Base
      # @param [User] current_user The current session user
      # @param [Title] title The dynamic title from the layout
      class TopBarComponent < ApplicationComponent
        def initialize(current_user:, title:)
          @current_user = current_user
          @title = title || "Welcome back, #{current_user.first_name}"
        end

        attr_reader :current_user, :title
      end
    end
  end
end
