# frozen_string_literal: true

# Recipe model
class Recipe < ApplicationRecord
  before_create :create_id

  belongs_to :author, class_name: :User, foreign_key: :user_id

  private

  def create_id
    loop do
      self.id = SecureRandom.alphanumeric(7)
      break unless self.class.exists?(id:)
    end
  end
end
