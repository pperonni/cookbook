class Recipe < ApplicationRecord
  enum status: { pending: 0, approved: 1, rejected: 66 }

  belongs_to :recipe_type
  belongs_to :cuisine
  belongs_to :user
  has_many :recipe_list_items
  has_many :recipe_list, through: :recipe_list_item
  has_one_attached :image

  validates :title, :recipe_type, :cuisine, :difficulty,
            :cook_time, :ingredients, :cook_method, presence: true

  validates :title, uniqueness: true

  def cook_time_min
    "#{cook_time} minutos"
  end
end
