# frozen_string_literal: true

module Days
  module Show
    # This is the mobile version component of the calendar day.
    class MobileComponent < DesktopComponent
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

      private

      def no_recipe_style
        if today? && !override_day?
          'text(alt hover:white dark:gray-200 dark:hover:layout-dark)
          bg(alt/30 hover:alt/80 dark:asset-dark dark:hover:main-dark)'
        else
          'text(gray-500 dark:main-dark dark:hover:white) bg(white dark:layout-dark hover:main/40
          dark:hover:alt-dark/50)'
        end
      end
    end
  end
end
