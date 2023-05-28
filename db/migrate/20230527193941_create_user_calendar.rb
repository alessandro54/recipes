class CreateUserCalendar < ActiveRecord::Migration[7.0]
  def change
    create_table :user_calendars, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.references :calendar, null: false, type: :string, foreign_key: true

      t.index %i[user_id calendar_id], unique: true
      t.index %i[calendar_id user_id], unique: true

      t.timestamps
    end
  end
end
