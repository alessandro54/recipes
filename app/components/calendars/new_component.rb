# frozen_string_literal: true

module Calendars
  class NewComponent < ApplicationComponent
    def initialize(calendar:)
      @calendar = calendar
    end
  end
end
