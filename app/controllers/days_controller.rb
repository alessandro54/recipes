# frozen_string_literal: true

class DaysController < BaseController
  def new
    render locals: { day: Date.parse(params.fetch(:date)) }
  end
end
