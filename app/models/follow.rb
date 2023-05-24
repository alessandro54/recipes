class Follow < ApplicationRecord
  belongs_to :follower, class_name: :User, foreign_key: :user_id
  belongs_to :followed_calendar, class_name: :Calendar, foreign_key: :calendar_id
end
