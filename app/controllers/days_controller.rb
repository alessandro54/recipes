# frozen_string_literal: true

class DaysController < BaseController
  before_action :set_day, except: %i[new create]

  def new
    render locals: {
      day: Date.parse(params.fetch(:date)),
      recipe_count: current_user.recipes.count,
      calendar_id: params[:calendar_id]
    }
  end

  def show; end

  def edit; end

  def create
    @day = Day.new(day_params)

    if @day.valid?
      @day.save
    else
      flash[:simple_alert] = 'There was an error'
    end

    redirect_to calendar_path(params[:calendar_id])
  end

  private

  def set_day
    @day = Day.find_by(when: params[:date], calendar_id: params[:calendar_id])
  end

  def day_params
    params.require(:day).permit(:when, :calendar_id, :recipe_id)
  end

  attr_reader :day
end
