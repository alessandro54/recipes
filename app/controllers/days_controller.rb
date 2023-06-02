# frozen_string_literal: true

class DaysController < BaseController
  before_action :set_day, except: :new

  def new
    render locals: { day: Date.parse(params.fetch(:date)) }
  end

  def show
    render locals: { day: }
  end

  def edit
    render locals: {
      day:
    }
  end

  private

  def set_day
    @day = Day.find_by(when: params[:date], calendar_id: params[:calendar_id])
  end

  attr_reader :day
end
