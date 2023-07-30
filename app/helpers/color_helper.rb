# frozen_string_literal: true

# Helper to manage colors
module ColorHelper
  # @param [Symbol] type
  # @param [Symbol] format
  # @return [String] Return the code of a random color with selected format
  def random_color(type: :light, format: :rgb)
    min_value = type == :light ? 180 : 0
    max_value = type == :light ? 255 : 100

    red = rand(min_value..max_value)
    green = rand(min_value..max_value)
    blue = rand(min_value..max_value)

    return "##{red.to_s(16)}#{green.to_s(16)}#{blue.to_s(16)}" if format == :hex

    "rgb(#{red}, #{green}, #{blue})"
  end
end
