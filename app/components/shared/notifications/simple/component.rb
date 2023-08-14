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
            alert:   'text-rose-500',
            success: 'text-emerald-500',
            info:    'text-sky-500',
            warn:    'text-amber-500'
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
            alert:   'bg-rose-100',
            success: 'bg-emerald-100',
            info:    'bg-sky-100',
            warn:    'bg-yellow-50'
          }.with_indifferent_access.fetch(type)
        end
        attr_reader :message, :mode
      end
    end
  end
end
