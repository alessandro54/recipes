# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DayHelper, type: :helper do
  let(:user) { create :user }
  let(:calendar) { create :calendar, owners: [user] }

  describe '#display_date' do
    it 'returns today' do
      expect(display_date(Date.today)).to eq('today')
    end

    it 'returns tomorrow' do
      expect(display_date(Date.tomorrow)).to eq('tomorrow')
    end

    it 'returns the correct format of string' do
      expect(display_date(Date.new(2023, 4, 21))).to eq('21 Apr')
    end
  end

  describe '#calendar_days' do
    it 'returns the correct payload' do
      days = (Date.today..Date.today + 5.days).map do |date|
        create(:day, calendar:, when: date)
      end
      puts days.first.recipe
      puts calendar_days(days:)
    end
  end
end
