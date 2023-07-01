# frozen_string_literal: true

module Shared
  module Notifications
    class Component < ApplicationComponent
      def initialize(flash:)
        super
        @flash = flash
      end

      def change_flash(flash)
        case flash
        when 'notice'
          'simple_success'
        when 'alert'
          'simple_alert'
        else
          flash
        end
      end

      attr_reader :flash
    end
  end
end
