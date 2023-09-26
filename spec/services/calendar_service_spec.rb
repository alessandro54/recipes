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

  describe '#delete' do
    it 'creates a delete request for calendar with 2 owners' do
      calendar = create(:calendar, owners: [user, create(:user)])

      result = subject.delete(calendar:, user:)

      expect(result).to be_a(Calendar::DeleteVote)
    end

    it 'discards a calendar with 1 owner' do
      calendar = create(:calendar, owners: [user])

      subject.delete(calendar:, user:)

      result = calendar.send(:discarded?)

      expect(result).to be_truthy
    end

    it 'discards a calendar with 4 owners' do
      owners = create_list(:user, 4)
      calendar = create(:calendar, owners:)

      owners.each do |owner|
        subject.delete(calendar:, user: owner)
      end

      result = calendar.send(:discarded?)

      expect(result).to be_truthy
    end

    it 'makes the last delete vote for a calendar' do
      owners = create_list(:user, 2)
      calendar = create(:calendar, owners: [*owners, user])
      create_list(:calendar_delete_vote, 2, calendar:)

      subject.delete(calendar:, user:)

      result = calendar.send(:discarded?)

      expect(result).to be_truthy
    end

    it 'tries to delete a discarded calendar' do
      calendar = create(:calendar, owners: [user])

      subject.delete(calendar:, user:)

      expect { subject.delete(calendar:, user:) }.to raise_error(ActiveRecord::RecordNotFound)
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

  describe '#deletable?' do
    it 'returns true if calendar has 1 owner and 1 delete vote' do
      calendar = create(:calendar, owners: [user])

      result = subject.send(:deletable?, calendar)

      expect(result).to be_truthy
    end

    it 'returns false if calendar has 5  owner and 1 delete votes' do
      calendar = create(:calendar, owners: [*create_list(:user, 5), user])

      create(:calendar_delete_vote, calendar:, user:)

      result = subject.send(:deletable?, calendar)

      expect(result).to be_falsey
    end
  end

  describe '#create_delete_vote' do
    it 'creates a delete vote for calendar' do
      calendar = create(:calendar, owners: [user])

      result = subject.send(:create_delete_vote, calendar, user)

      expect(result).to be_a(Calendar::DeleteVote)
      expect(calendar.delete_votes).to contain_exactly(result)
    end
  end
end
