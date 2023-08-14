# frozen_string_literal: true

class ApplicationService
  include Rails.application.routes.url_helpers

  def self.call(*, &)
    new(*, &).call
  end
end
