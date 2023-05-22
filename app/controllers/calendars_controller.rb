class CalendarsController < BaseController
  include CalendarHelper
  def index; end

  def prev_month
    @day = Date.parse(params[:day])
    @month = generate_month(
      @day.at_beginning_of_month.prev_month
    )
  end

  def next_month
    @day = Date.parse(params[:day])
    @month = generate_month(
      @day.at_beginning_of_month.next_month
    )
  end
end
