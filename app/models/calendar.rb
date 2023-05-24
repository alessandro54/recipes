class Calendar < ApplicationRecord
  before_create :create_id

  belongs_to :owner, class_name: :User, foreign_key: :user_id
  has_many :followers, class_name: :Follow

  private

  def create_id
    loop do
      self.id = SecureRandom.alphanumeric(10)
      break unless self.class.exists?(id:)
    end
  end
end
