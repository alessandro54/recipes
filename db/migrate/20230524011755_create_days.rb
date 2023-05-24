class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.date :when
      t.references :recipe, type: :string, null: false, foreign_key: true

      t.index :when, unique: true
      t.timestamps
    end
  end
end
