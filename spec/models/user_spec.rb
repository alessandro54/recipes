# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:calendars) }
    it { should belong_to(:main_calendar).required(false) }
    it { should have_many(:follows) }
    it { should have_many(:followed_calendars) }
    it { should have_many(:recipes) }
  end

  describe 'validations' do
    subject { build(:user) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:username).allow_blank }
    it { should allow_value('sanity44').for(:username) }
    it { should_not allow_value('sanity goes to a park').for(:username) }
  end

  describe '#full_name' do
    subject { create(:user, first_name: 'Alessandro', last_name: 'Chumpitaz') }
    it 'returns the full name of the user' do
      expect(subject.full_name).to eq('Alessandro Chumpitaz')
    end
  end

  describe '#mini_name' do
    subject { create(:user, first_name: 'Alessandro', last_name: 'Chumpitaz') }
    it 'returns the mini name display of the name' do
      expect(subject.mini_name).to eq('AC')
    end
  end

  describe '#owner?' do
    subject { create(:user) }
    let(:user2) { create(:user) }
    let(:calendar) { create(:calendar, owners: [subject]) }

    it { is_expected.to be_owner calendar: }

    it 'is not owner' do
      expect(user2).not_to be_owner calendar:
    end
  end
end
