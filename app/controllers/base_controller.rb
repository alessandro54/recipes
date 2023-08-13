# frozen_string_literal: true

class BaseController < ApplicationController
  layout 'base'
  before_action :authenticate_user!

  rescue_from Pagy::OverflowError, with: :redirect_to_first_page

  private

  def redirect_to_first_page
    redirect_to url_for(page: 1)
  end
end
