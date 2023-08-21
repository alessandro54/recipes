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
      def initialize(calendar_id:, payload:, **opts)
        @calendar_id = calendar_id
        @day = payload[:day]
        @month = payload[:month]
        @date = payload[:date]
        @opts = opts
      end

      protected

      def from_month?
        @date.month == @month
      end

      def today?
        @date == Date.today
      end

      def override_day?
        @date != Date.today
      end

      def not_from_month
        if @date.month > @month
          Date.new(@date.year, @month, 1).next_month
        else
          Date.new(@date.year, @month, 1).prev_month
        end
      end

      def eager_load
        @opts[:eager_load] || false
      end
    end
  end
end
