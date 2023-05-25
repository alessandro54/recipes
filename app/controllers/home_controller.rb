class HomeController < BaseController
  def index
    @days = Day.from_date(2022, 2)
  end
end
