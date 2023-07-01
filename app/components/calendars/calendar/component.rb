# frozen_string_literal: true

module Calendars
  module Calendar
    class Component < ApplicationComponent
      def initialize(calendar:, date:, calendar_days:)
        super
        @calendar = calendar
        @date = date
        @calendar_days = calendar_days
        @override_day = date != Date.today
      end

      def adaptive_styles(length)
        case length
        when 7
          'grid-rows-7'
        when 6
          'grid-rows-6'
        when 5
          'grid-rows-5'
        else
          'grid-rows-4'
        end
      end
    end
  end
end
