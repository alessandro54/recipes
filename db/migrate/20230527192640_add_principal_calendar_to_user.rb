class AddPrincipalCalendarToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :calendar, null: true, type: :string, foreign_key: true
    remove_reference :calendars, :user
  end
end
