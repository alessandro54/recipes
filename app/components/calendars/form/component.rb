# frozen_string_literal: true

module Calendars
  module Form
    class Component < ApplicationComponent
      def initialize(calendar:)
        @calendar = calendar
      end
    end
  end
end
