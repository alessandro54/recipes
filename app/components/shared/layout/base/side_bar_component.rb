# frozen_string_literal: true

module Shared
  module Layout
    module Base
      class SideBarComponent < ApplicationComponent
        def initialize(current_user:)
          @current_user = current_user
        end

        def nav_options
          {
            dashboard:   {icon: 'rectangle-group', path: root_path},
            my_calendar: {icon: 'calendar-days', path: my_calendar_path},
            recipes:     {icon: 'book', path: recipes_path},
            calendars:   {icon: 'rectangle-stack', path: calendars_path}
          }
        end

        attr_reader :current_user
      end
    end
  end
end
