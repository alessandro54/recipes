# frozen_string_literal: true

class Day < ApplicationRecord
  self.primary_key = :digest

  scope :from_date, lambda {|year=Date.today.year, month=Date.today.month|
    date = Date.new(year, month)
    where(when: date...date.next_month)
  }

  scope :from_this_month, -> { where(when: Date.today.all_month) }

  validates :when, presence: true
  validate :valid_date_format

  before_create :create_digest

  belongs_to :calendar
  belongs_to :recipe

  private

  def create_digest
    loop do
      self.digest = SecureRandom.hex(8)
      break unless self.class.exists?(digest:)
    end
  end

  def valid_date_format
    return if self.when.is_a?(Date)

    errors.add(:when, 'must be a valid date')
  end
end
