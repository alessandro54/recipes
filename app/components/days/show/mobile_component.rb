# frozen_string_literal: true

module Days
  module Show
    # This is the mobile version component of the calendar day.
    class MobileComponent < DesktopComponent
      # Initializes the component.
      #
      # @param calendar_id [String] the calendar id.
      # @param payload [{
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

      def no_recipe_style
        if today? && !override_day?
          'text(alt hover:white dark:gray-200 dark:hover:layout-dark)
          bg(main/40 hover:alt/80 dark:asset-dark dark:hover:main-dark)'
        else
          'text(gray-500 dark:main-dark dark:hover:white) bg(white dark:layout-dark hover:main/40
          dark:hover:alt-dark/50)'
        end
      end
    end
  end
end
