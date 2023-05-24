# frozen_string_literal: true

class Day < ApplicationRecord
  self.primary_key = :digest

  before_create :create_digest

  belongs_to :calendar
  belongs_to :recipe

  private

  def create_digest
    loop do
      self.digest = Digest::MD5.hexdigest("#{self.when}-#{calendar_id}")[8..15]
      break unless self.class.exists?(digest:)
    end
  end
end
