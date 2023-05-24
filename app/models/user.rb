class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_one :calendar, dependent: :destroy

  has_many :followed_calendars, class_name: :Follow
  has_many :followers, through: :followed_calendars

  def full_name
    "#{first_name} #{last_name}"
  end

  def mini_name
    full_name.split.map(&:first).join
  end

  private

  def create_calendar; end
end
