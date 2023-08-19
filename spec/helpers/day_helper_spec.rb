# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DayHelper, type: :helper do
  let(:user) { create :user }
  let(:calendar) { create :calendar, owners: [user] }

  describe '#display_date' do
    it 'returns today' do
      expect(display_date(Date.today)).to eq('today')
    end

    it 'returns the correct format of string' do
      expect(display_date(Date.new(2023, 4, 21))).to eq('21 Apr')
    end
  end

  describe '#calendar_days' do
    let(:days) {
      (Date.new(2023, 8, 1)..Date.new(2023, 8, 6)).map {|date|
        create(:day, calendar:, when: date)
      }
    }

    it 'returns the correct payload week size' do
      result = calendar_days(days:)

      first_set = result.first
      expect(first_set.length).to be(7)
    end

    it 'returns the correct day payload' do
      first_set = calendar_days(days:).first
      expect(first_set.first).to eq({date: Date.new(2023, 7, 31), month: 8, day: nil})

      expect(first_set.last).to eq({date: Date.new(2023, 8, 6), month: 8, day: days.last})
    end
  end
end
