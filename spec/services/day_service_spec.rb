# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DayService, type: :service do
  subject { described_class.new }

  let(:owner) { create :user }
  let(:calendar) { create :calendar, owners: [owner] }

  describe '#list' do
    it 'returns the days from a calendar' do
      days = (Date.today..Date.today + 5.days).map do |date|
        create(:day, calendar:, when: date)
      end

      result = subject.list(calendar_id: calendar.id)

      expect(result).to contain_exactly(*days)
    end

    it 'returns empty on a month without days' do
      (Date.today..Date.today + 5.days).map do |date|
        create(:day, calendar:, when: date)
      end
      result = subject.list(calendar_id: calendar.id, month: Date.today.month + 1)

      expect(result).to be_empty
    end
  end

  describe '#save' do
    let(:recipe) { create :recipe, author: owner }

    context 'if is the owner of the calendar' do
      it 'saves a new day to the database' do
        expect {
          subject.save(user_id:     owner.id,
                       calendar_id: calendar.id,
                       when:        Date.today,
                       recipe_id:   recipe.id)
        }.to change(Day, :count).by(1)
      end
    end

    context 'if is not the owner of the calendar' do
      let(:user) { create :user }
      it 'not saves a new day to the database' do
        expect {
          subject.save(user_id:     user.id,
                       calendar_id: calendar.id,
                       when:        Date.today,
                       recipe_id:   recipe.id)
        }.to_not change(Day, :count)
      end
    end
  end

  # describe '#generate_for' do
  #   let(:payload) { subject.generate_for(date: Date.new(2022, 2, 1)) }

  #   it 'returns an array of 5 weeks' do
  #     expect(payload).to be_an(Array)
  #     expect(payload.size).to eq 5
  #     expect(payload.first.size).to eq 7
  #   end

  #   it 'returns the correct form of the payload' do
  #     day = payload.flatten.first

  #     expect(day).to eq(
  #       {
  #         id:            nil,
  #         today:         false,
  #         date:          Date.new(2022, 1, 31),
  #         current_month: false,
  #         recipe:        nil
  #       }
  #     )
  #   end
  # end

  # describe '#prev_month' do
  #   let(:payload) { subject.prev_month(Date.new(2023, 4, 21)).flatten }

  #   it 'returns the previous month' do
  #     expect(payload.first[:date]).to eq(Date.new(2023, 2, 27))
  #     expect(payload.last[:date]).to eq(Date.new(2023, 4, 2))
  #   end
  # end

  # describe '#next_month' do
  #   let(:payload) { subject.next_month(Date.new(2023, 4, 21)).flatten }

  #   it 'returns the next month' do
  #     expect(payload.first[:date]).to eq(Date.new(2023, 5, 1))
  #     expect(payload.last[:date]).to eq(Date.new(2023, 6, 4))
  #   end
  # end
end
