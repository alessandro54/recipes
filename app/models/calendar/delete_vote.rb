# frozen_string_literal: true

class Calendar::DeleteVote < ApplicationRecord
  belongs_to :user
  belongs_to :calendar

  def self.table_name_prefix
    'calendar_'
  end
end
