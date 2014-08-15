class CreateRecipeItems < ActiveRecord::Migration
  def change
    create_table :recipe_items do |t|
      t.references :recipe, index: true
      t.string :content

      t.timestamps
    end
  end
end
