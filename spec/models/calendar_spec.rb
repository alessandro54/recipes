# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calendar, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:owners) }
    it { should have_many(:follows) }
    it { should have_many(:followers) }
    it { should have_many(:days) }
    it { should have_many(:recipes) }
  end

  describe '#owned?' do
    subject { create :calendar, :with_owners }
    let(:user) { subject.owners.first }
    let(:user2) { create :user }

    it { is_expected.to be_owned user: }
    it { is_expected.not_to be_owned user: user2 }
  end
end
