# frozen_string_literal: true

# Main user class, who has access to the app
class User < ApplicationRecord
  before_save :blank_username_to_nil
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :calendars, class_name: 'Calendar', join_table: 'user_calendars'

  has_one_attached :avatar, dependent: :destroy

  belongs_to :main_calendar, class_name: 'Calendar', optional: true, foreign_key: :calendar_id

  has_many :follows, dependent: :destroy
  has_many :followed_calendars, through: :follows, source: :calendar
  has_many :recipes, dependent: :nullify

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z']+\z/ }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z']+\z/ }
  validates :email, uniqueness: true
  validates :username, uniqueness: { allow_blank: true }, format: { with: /\A\w+\z/, allow_blank: true }

  def full_name
    "#{first_name} #{last_name}"
  end

  def mini_name
    full_name.split.map(&:first).join
  end

  def owner?(calendar:)
    calendar.owners.include?(self)
  end

  def follow(calendar:)
    followed_calendars << calendar
  end

  def follower?(calendar:)
    calendar.followers.include?(self)
  end

  private

  def blank_username_to_nil
    self.username = nil if username.blank?
  end
end
