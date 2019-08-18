class AddIngredMethodToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ingredients, :text
    add_column :recipes, :cook_method, :text
  end
end
