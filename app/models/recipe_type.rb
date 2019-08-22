class RecipeType < ApplicationRecord
  has_many :recipes

  validates :name, presence: true
  validates :name, uniqueness: {message: 'O nome do Tipo de Receita já está cadastrado'}
end
