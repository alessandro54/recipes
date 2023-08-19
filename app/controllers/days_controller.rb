# frozen_string_literal: true

class DaysController < BaseController
  before_action :set_calendar, only: :create
  before_action :set_day, except: %i[new create]

  def new
    render locals: {
      day:          Date.parse(params.fetch(:date)),
      recipe_count: current_user.recipes.count,
      calendar_id:  params[:calendar_id]
    }
  end

  def show; end

  def edit; end

  def create
    @day = day_service.save(user_id: current_user.id, **day_params)

    redirect_to calendar_path(calendar), alert: 'There was an error with the provided date' and return unless @day

    respond_to do |format|
      format.turbo_stream { render :create, status: :created }
    end
  end

  private

  def set_day
    @day = Day.find_by(when: params[:date], calendar_id: params[:calendar_id])
  end

  def set_calendar
    @calendar = Calendar.find(params[:calendar_id])
  end

  def day_params
    params.require(:day).permit(:when, :recipe_id).merge(calendar_id: params[:calendar_id])
  end

  def day_service
    @day_service ||= DayService.new
  end

  attr_reader :day, :calendar
end
