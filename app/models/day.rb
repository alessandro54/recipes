# frozen_string_literal: true

class Day < ApplicationRecord
  self.primary_key = :digest

  scope :from_date, lambda { |year = Date.today.year, month = Date.today.month|
    date = Date.new(year, month)
    where(when: date...date.next_month)
  }

  scope :from_this_month, -> { where(when: Date.today.all_month) }

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
end
