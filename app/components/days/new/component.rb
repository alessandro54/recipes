# frozen_string_literal: true

module Days
  module New
    class Component < ApplicationComponent
      def initialize(current_user:, calendar:)
        @current_user = current_user
        @calendar = calendar
      end

      attr_reader :current_user
    end
  end
end
