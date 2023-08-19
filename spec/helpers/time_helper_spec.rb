# frozen_string_literal: true

RSpec.describe TimeHelper, type: :helper do
  describe '#minutes_to_hours_and_minutes' do
    it 'returns the correct string for 180 minutes' do
      result = minutes_to_hours_and_minutes(180)

      expect(result).to eq('3h')
    end

    it 'returns the correct string for 124 minutes' do
      result = minutes_to_hours_and_minutes(124)

      expect(result).to eq('2h 4m')
    end
  end
end
