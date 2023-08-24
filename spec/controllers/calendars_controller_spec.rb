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

    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE destroy' do
    context 'when the calendar has only 1 owner' do
      let(:calendar) { create(:calendar, owners: [user]) }

      before do
        delete :destroy, params: {id: calendar.id}
      end

      it 'discards the calendar' do
        expect(calendar.reload.discarded?).to be_truthy
      end

      it 'responds with a 204' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the calendar has more than 1 owner' do
      let(:calendar) { create(:calendar, owners: [*create_list(:user, 3), user]) }

      before do
        delete :destroy, params: {id: calendar.id}
      end

      it 'creates a new delete vote' do
        expect(calendar.reload.delete_votes.count).to eq(1)
      end

      it 'does not discard the calendar' do
        expect(calendar.reload.discarded?).to be_falsey
      end

      it 'responds with a 204 status' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
