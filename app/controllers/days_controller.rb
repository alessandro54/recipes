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
    @calendar = Calendar.find(day_params.fetch(:calendar_id))
    @date = Date.parse(day_params.fetch(:when))

    if Day.create(day_params)
      @calendar_days = days_service.generate_for(date: @date)
      respond_to do |format|
        format.turbo_stream { render :create }
      end
    end
  rescue Date::Error
    redirect_to calendar_path(@calendar), alert: 'There was an error with the provided date'
  end

  private

  def set_day
    @day = Day.find_by(when: params[:date], calendar_id: params[:calendar_id])
  end

  def day_params
    params.require(:day).permit(:when, :recipe_id).merge(calendar_id: params[:calendar_id])
  end

  def days_service
    @days_service ||= DaysService.new(calendar:)
  end

  attr_reader :day, :calendar
end
