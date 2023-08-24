# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarService, type: :service do
  subject { described_class.new }
  let(:user) { create(:user) }

  describe '#find' do
    it 'returns a record' do
      calendar = create(:calendar, owners: [user])

      result = subject.find(id: calendar.id)

      expect(result).to eq(calendar)
    end
  end

  describe '#list' do
    it 'returns all records belonging to user' do
      calendar1 = create(:calendar, owners: [user])
      calendar2 = create(:calendar, owners: [user])

      result = subject.list(user_id: user.id)

      expect(result).to contain_exactly(calendar1, calendar2)
    end
  end

  describe '#save' do
    it 'returns a new calendar record' do
      calendar_params = {title: 'My Calendar'}

      result = subject.save(calendar_params, user:)

      expect(result).to be_a(Calendar)
      expect(result.title).to eq(calendar_params[:title])
    end
  end

  describe '#assign_owners' do
    it 'assigns owners to calendar' do
      user_list = create_list(:user, 3)

      calendar = create(:calendar)

      subject.assign_owners(calendar:, users: user_list)

      expect(calendar.owners).to contain_exactly(*user_list)
    end

    it 'does not assign owners to calendar if users is not an array' do
      user = create(:user)

      calendar = create(:calendar)

      subject.assign_owners(calendar:, users: user)

      expect(calendar.owners).to be_empty
    end
  end

  describe '#assign_owner' do
    it 'assigns owner to calendar' do
      user = create(:user)

      calendar = create(:calendar)

      subject.assign_owner(calendar:, user:)

      expect(calendar.owners).to contain_exactly(user)
    end

    it 'does not assign owner to calendar if user is not a User' do
      user = create(:user)

      calendar = create(:calendar)

      subject.assign_owner(calendar:, user: user.id)

      expect(calendar.owners).to be_empty
    end
  end
end
