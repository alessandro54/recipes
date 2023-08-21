# frozen_string_literal: true

# This is a playground controller, it's not meant to be used in production
class PlaygroundsController < BaseController
  def show
    flash[:simple_info] = 'This is a simple info message'
    flash[:simple_warn] = 'This is a simple warn message'
    flash[:simple_alert] = 'This is a simple warn message'
    flash[:simple_success] = 'This is a simple warn message'
  end
end
