class AddDiscardedAtToCalendars < ActiveRecord::Migration[7.0]
  def change
    add_column :calendars, :discarded_at, :datetime
    add_index :calendars, :discarded_at
  end
end
