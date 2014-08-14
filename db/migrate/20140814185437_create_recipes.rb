class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :title
      t.integer :coffee
      t.integer :water
      t.integer :seconds
      t.text :description

      t.timestamps
    end
  end
end
