class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days, id: false do |t|
      t.date :when
      t.string :digest
      t.references :calendar, type: :string, null: false, foreign_key: true
      t.references :recipe, type: :string, null: false, foreign_key: true

      t.index %i[when calendar_id], unique: true
      t.index :digest, unique: true
      t.timestamps
    end
  end
end
