# frozen_string_literal: true

class DaysController < BaseController
  def new
    100.times { puts params }
    render :new
  end
end
