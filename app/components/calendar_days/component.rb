# frozen_string_literal: true

module CalendarDays
  class Component < ApplicationComponent
    def initialize(calendar:, date:, calendar_days:)
      super
      @calendar = calendar
      @date = date
      @calendar_days = calendar_days
      @override_day = date != Date.today
    end

    private

    def mobile_without_recipes_styles(is_today: false)
      if is_today && !@override_day
        'text(black dark:gray-200 dark:hover:layout-dark)
        bg(secondary/60 hover:gray-100 dark:asset-dark dark:hover:main-dark)'
      else
        'text(black dark:main-dark dark:hover:white) bg(white dark:layout-dark hover:main/50
        dark:hover:alt-dark/50)'
      end
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
