# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DaysController, type: :controller do
  let(:user) { create(:user, :with_main_calendar) }
  let(:recipe) { create(:recipe, author: user) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    let(:calendar) { create(:calendar, owners: [user]) }

    render_views

    context 'with valid params' do
      let(:valid_params) do
        {
          calendar_id: calendar.id,
          day:         {
            recipe_id: recipe.id,
            when:      Date.today.beginning_of_month
          }
        }
      end

      it 'responds with a 201 status' do
        expect(response).to have_http_status(:success)
      end

      it 'creates a new day and returns a turbo stream response' do
        expect { post :create, params: valid_params, format: :turbo_stream }
          .to change { calendar.days.count }.by(1)
      end

      it 'returns a turbo_stream response with the correct template' do
        post :create, params: valid_params, format: :turbo_stream

        expect(response.media_type).to eq('text/vnd.turbo-stream.html')
        expect(response.body).to include('turbo-stream')
      end
    end

    context 'with invalid date' do
      let(:invalid_params) do
        {
          calendar_id: calendar.id,
          day:         {
            when: nil
          }
        }
      end

      it 'does not create a new day and renders an alert' do
        expect {
          post :create, params: invalid_params, format: :turbo_stream
        }.to_not change(Day, :count)

        expect(flash[:alert]).to be_present
      end
    end
  end
end
