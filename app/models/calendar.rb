# frozen_string_literal: true

# Personal calendar is always created, but users can subscribe to another one
class Calendar < ApplicationRecord
  before_create :create_id

  has_and_belongs_to_many :owners, class_name: :User, join_table: :user_calendars

  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :follower
  has_many :days, dependent: :destroy
  has_many :recipes, -> { distinct }, through: :days, source: :recipe

  validates :title, presence: true, format: { with: /\A[\w\s!.]+\z/ }

  def owned?(user:)
    owners.include?(user)
  end

  private

  def create_id
    loop do
      self.id = SecureRandom.alphanumeric(10)
      break unless self.class.exists?(id:)
    end
  end
end
