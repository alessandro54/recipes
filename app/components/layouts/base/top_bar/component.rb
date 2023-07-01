# frozen_string_literal: true

module Layouts
  module Base
    module TopBar
      class Component < ApplicationComponent
        def initialize(current_user:)
          super
          @current_user = current_user
        end

        attr_reader :current_user
      end
    end
  end
end
