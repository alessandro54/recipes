# frozen_string_literal: true

module Days
  module Show
    # This is the desktop version component of the calendar day.
    class DesktopComponent < ApplicationComponent
      # Initializes the component.
      #
      # @param calendar_id [String] the calendar id.
      # @param payload [{
      #    date: [Date] the date of the payload
      #    month: [Integer] the issued month.
      #    day: [Day] the day linked to the date
      # }] the day payload.
      def initialize(calendar_id:, payload:)
        @calendar_id = calendar_id
        @day = payload[:day]
        @month = payload[:month]
        @date = payload[:date]
      end

      private

      def from_current_month?
        @date.month == @month
      end

      def today?
        @date == Date.today
      end

      def overrided_day?
        @date != Date.today
      end
    end
  end
end
