class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end

  def mini_name
    full_name.split.map(&:first).join
  end
end
