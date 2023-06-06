# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Day, type: :model do
  describe 'associations' do
    it { should belong_to(:calendar) }
    it { should belong_to(:recipe) }
  end
end
