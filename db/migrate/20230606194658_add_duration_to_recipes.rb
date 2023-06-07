class AddDurationToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :duration, :integer
  end
end
