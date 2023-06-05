# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:days_made) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
