# frozen_string_literal: true

module Calendars
  class Component < ApplicationComponent
    def initialize(calendar:)
      super
      @calendar = calendar
    end

    attr_reader :calendar
  end
end
