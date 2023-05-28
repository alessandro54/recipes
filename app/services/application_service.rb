class ApplicationService
  def self.call(*_args, &block)
    new(*args, &block).call
  end
end
