# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DaysService, type: :service do
  describe '#generate_for' do
    let(:calendar) { create :calendar }
    it 'returns an array of 5 weeks' do
      result = described_class.new(calendar:).generate_for(
        date: Date.new(2022, 2, 1)
      )

      expect(result).to be_an(Array)
      expect(result.size).to eq 5
      expect(result.first.size).to eq 7
    end

    it 'returns the correct form of the payload' do
      result = described_class.new(calendar:).generate_for(
        date: Date.new(2022, 2, 1)
      )
      day = result.first.first

      expect(day).to eq(
        {
          id: nil,
          today: false,
          date: Date.new(2022, 1, 31),
          current_month: false,
          recipe: nil
        }
      )
    end
  end
end
