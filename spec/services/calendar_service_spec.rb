# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarService, type: :service do
  let(:user) { create :user }

  describe '#find' do
    subject { described_class.new }

    it 'returns a record' do
      calendar = create(:calendar, owners: [user])

      result = subject.find(id: calendar.id)

      expect(result).to eq(calendar)
    end
  end

  describe '#list' do
    subject { described_class.new }

    it 'returns all records belonging to user' do
      calendar1 = create(:calendar, owners: [user])
      calendar2 = create(:calendar, owners: [user])

      result = subject.list(user_id: user.id)

      expect(result).to contain_exactly(calendar1, calendar2)
    end
  end
end
