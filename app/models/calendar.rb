# frozen_string_literal: true

# Personal calendar is always created, but users can subscribe to another one
class Calendar < ApplicationRecord
  before_create :create_id

  belongs_to :owner, class_name: :User, foreign_key: :user_id

  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :follower

  private

  def create_id
    loop do
      self.id = SecureRandom.alphanumeric(10)
      break unless self.class.exists?(id:)
    end
  end
end
