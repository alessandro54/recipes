# frozen_string_literal: true

module Layouts
  module Base
    class TopBarComponent < ViewComponent::Base
      include SvgHelper

      def initialize(current_user:)
        @current_user = current_user
      end
    end
  end
end
