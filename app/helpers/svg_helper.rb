# frozen_string_literal: true

# Helper to image utils
module SvgHelper
  def svg(path, type: 'outline')
    File.open("app/assets/svg/#{type}/#{path}.svg", 'rb') do |file|
      raw file.read
    end
  end
end
