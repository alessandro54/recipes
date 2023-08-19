# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:days_made) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should allow_value('Tiramisù').for(:title) }
    it { should_not allow_value('title with spaces!!!').for(:title) }
    it { should_not allow_value('title with @#$%').for(:title) }
  end
end
