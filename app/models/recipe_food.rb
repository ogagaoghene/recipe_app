class RecipeFood < ApplicationRecord
  belongs_to :food, class_name: 'Food'
  belongs_to :recipe, class_name: 'Recipe'

  validates :food_id, presence: true
  validates :recipe_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
