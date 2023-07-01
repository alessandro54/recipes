# frozen_string_literal: true

module Calendars
  module Navigator
    class Component < ApplicationComponent
      def initialize(calendar:, date:)
        super
        @date = date
        @calendar = calendar
      end
    end
  end
end
