class CreateCalendarDeleteVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_delete_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :calendar, type: :string, null: false, foreign_key: true

      t.timestamps
    end
  end
end
