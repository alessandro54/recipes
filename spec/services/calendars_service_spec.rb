# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarsService, type: :service do
  let(:user) { create :user }

  describe '#find' do
    subject { described_class.new(user:) }

    it 'returns a record' do
      calendar = create(:calendar, owners: [user])

      result = subject.find(id: calendar.id)

      expect(result).to eq(calendar)
    end
  end

  describe '#all' do
    subject { described_class.new(user:) }

    it 'returns all records' do
      calendar1 = create(:calendar, owners: [user])
      calendar2 = create(:calendar, owners: [user])

      result = subject.all

      expect(result).to contain_exactly(calendar1, calendar2)
    end
  end
end
