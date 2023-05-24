# frozen_string_literal: true

# Main user class, who has access to the app
class User < ApplicationRecord
  after_create :create_calendar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_one :calendar, dependent: :destroy

  has_many :follows, dependent: :destroy
  has_many :followed_calendars, through: :follows, source: :calendar
  has_many :calendar_followers, through: :calendar, source: :followers

  def full_name
    "#{first_name} #{last_name}"
  end

  def mini_name
    full_name.split.map(&:first).join
  end

  def follow(calendar:)
    followed_calendars << calendar
  end

  private

  def create_calendar
    Calendar.new(
      owner: self,
      title: "#{first_name}'s Personal Calendar"
    ).save!
  end
end
