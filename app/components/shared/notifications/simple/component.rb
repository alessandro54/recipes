# frozen_string_literal: true

module Shared
  module Notifications
    module Simple
      class Component < ApplicationComponent
        def initialize(message:, mode:)
          super
          @message = message
          @mode = mode
        end

        def icon_style(type)
          {
            alert:   'text(rose-500 dark:rose-300)',
            success: 'text(emerald-500 dark:emerald-300)',
            info:    'text(sky-500 dark:sky-300)',
            warn:    'text(amber-500 dark:amber-300)'
          }.with_indifferent_access.fetch(type)
        end

        def icon(type)
          {
            alert:   'x-circle',
            success: 'check-circle',
            info:    'information-circle',
            warn:    'exclamation-triangle'
          }.with_indifferent_access.fetch(type)
        end

        def title(type)
          {
            alert:   'Error',
            success: 'Success',
            info:    'Info',
            warn:    'Warning'
          }.with_indifferent_access.fetch(type)
        end

        def background(type)
          {
            alert:   'bg(rose-100 dark:rose-700)',
            success: 'bg(emerald-100 dark:emerald-700)',
            info:    'bg(sky-100 dark:sky-700)',
            warn:    'bg(amber-100 dark:amber-700)'
          }.with_indifferent_access.fetch(type)
        end
        attr_reader :message, :mode
      end
    end
  end
end
