# frozen_string_literal: true

module Calendars
  module Days
    # This is the desktop version component of the calendar day.
    class DesktopComponent < ApplicationComponent
      # Initializes the component.
      #
      # @param calendar_id [String] the calendar id.
      # @param day [{
      #    id: [String] the day id if it has a recipe assigned.
      #    today: [Boolean] if the day is today.
      #    date: [Date] the day date.
      #    current_month: [Boolean] if the day is from the current month.
      #    recipe: [Recipe] the recipe of the day.
      # }] the day payload.
      def initialize(calendar_id:, day:)
        @calendar_id = calendar_id
        @day = day
        @recipe = day[:recipe]
        @date = day[:date]
      end

      private

      def from_current_month?
        @day[:current_month]
      end

      def today?
        @day[:today]
      end

      def overrided_day?
        @date != Date.today
      end
    end
  end
end
