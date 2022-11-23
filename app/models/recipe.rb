class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, class_name: 'RecipeFood', dependent: :delete_all

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def all_ingredients
    # All ingredients that are in the recipe
    RecipeFood.includes([:food]).where(recipe_id: id)
  end

  def available_foods
    # All foods for user that are not in the recipe
    user.foods.where.not(id: all_ingredients.map(&:food_id))
  end

  def total_price
    # Total price of the recipe
    sum = 0
    all_ingredients.each do |i|
      sum += i.food.price * i.quantity
    end

    sum
  end

end
