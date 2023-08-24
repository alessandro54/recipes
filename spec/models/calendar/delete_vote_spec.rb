require 'rails_helper'

RSpec.describe Calendar::DeleteVote, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:calendar) }
  end
end
