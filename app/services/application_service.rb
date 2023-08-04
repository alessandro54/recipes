class ApplicationService
  include Rails.application.routes.url_helpers

  def self.call(*args, &block)
    new(*args, &block).call
  end
end
