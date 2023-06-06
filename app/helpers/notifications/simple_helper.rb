# frozen_string_literal: true

module Notifications
  # Helper for simple notification
  module SimpleHelper
    def simple_notification_icon_styles(type)
      {
        alert: 'text-rose-500',
        success: 'text-emerald-500',
        info: 'text-sky-500',
        warn: 'text-amber-500'
      }.with_indifferent_access.fetch(type)
    end

    def simple_notification_icon(type)
      {
        alert: 'x-circle',
        success: 'check-circle',
        info: 'information-circle',
        warn: 'exclamation-triangle'
      }.with_indifferent_access.fetch(type)
    end

    def simple_notification_title(type)
      {
        alert: 'Error',
        success: 'Success',
        info: 'Info',
        warn: 'Warning'
      }.with_indifferent_access.fetch(type)
    end

    def simple_notification_background(type)
      {
        alert: 'bg-rose-100',
        success: 'bg-emerald-100',
        info: 'bg-sky-100',
        warn: 'bg-yellow-50'
      }.with_indifferent_access.fetch(type)
    end
  end
end
