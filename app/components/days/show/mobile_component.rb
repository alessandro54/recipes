# frozen_string_literal: true

module Days
  module Show
    # This is the mobile version component of the calendar day.
    class MobileComponent < ApplicationComponent
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

      def no_recipe_style
        if today? && !overrided_day?
          'text(black dark:gray-200 dark:hover:layout-dark)
          bg(secondary/60 hover:gray-100 dark:asset-dark dark:hover:main-dark)'
        else
          'text(black dark:main-dark dark:hover:white) bg(white dark:layout-dark hover:main/50
          dark:hover:alt-dark/50)'
        end
      end
    end
  end
end
