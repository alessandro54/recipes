class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes, id: :string do |t|
      t.string :title
      t.text :description
      t.string :steps, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
