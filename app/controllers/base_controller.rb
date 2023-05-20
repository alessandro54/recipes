# frozen_string_literal: true

class BaseController < ApplicationController
  layout 'base'
  before_action :authenticate_user!
end
