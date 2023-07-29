# frozen_string_literal: true

module Layouts
  module Base
    module TopBar
      # @param [User] current_user The current session user
      # @param [Title] title The dynamic title from the layout
      class Component < ApplicationComponent
        def initialize(current_user:, title:)
          super
          @current_user = current_user
          @title = title || "Welcome back, #{current_user.first_name}"
        end

        attr_reader :current_user, :title
      end
    end
  end
end
