# frozen_string_literal: true

FactoryBot.define do
  factory :calendar_delete_vote, class: 'Calendar::DeleteVote' do
    calendar
    user
  end
end
