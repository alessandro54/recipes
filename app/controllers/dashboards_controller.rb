# frozen_string_literal: true

# Root controller
class DashboardsController < BaseController
  def index
    @upcoming = Day.joins(calendar: :owners).where(
      calendar: {
        users: {
          id: current_user.id
        }
      },
      when: Date.today
    )
  end
end
