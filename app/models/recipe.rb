# frozen_string_literal: true

# Recipe model
class Recipe < ApplicationRecord
  before_create :create_id

  scope :with_photos, -> { includes image_attachment: :blob }

  has_one_attached :image

  belongs_to :author, class_name: :User, foreign_key: :user_id
  has_many :days_made, class_name: :Day

  validates :title, presence: true, format: { with: /\A[a-zA-Z\s.]+\z/ }

  private

  def create_id
    loop do
      self.id = SecureRandom.alphanumeric(7)
      break unless self.class.exists?(id:)
    end
  end
end
