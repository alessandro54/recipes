# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do
  let(:user) { create(:user, :with_main_calendar) }

  before do
    sign_in user
  end

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'renders with the base layout' do
      get :index
      expect(response).to render_template(:index, layout: 'layouts/base')
    end
  end
end
