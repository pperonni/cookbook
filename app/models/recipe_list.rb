class RecipeList < ApplicationRecord
  belongs_to :user
  has_many :recipe_list_items
  has_many :recipes, through: :recipe_list_items

  validates :name, uniqueness: true
end
