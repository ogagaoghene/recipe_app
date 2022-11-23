class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :foods
  has_many :recipes
  validates :name, presence: true

  def general_list
    # get total quantity of foods required
    foods_quantity_sum = RecipeFood.select(:food_id,
                                           'SUM(quantity) as quantity_sum').group(:food_id).order('quantity_sum')
    list = []

    # select foods for current_user with insufficient quantity
    foods.each do |food|
      expected_quantity = foods_quantity_sum.where(food:).first&.quantity_sum || nil

      next unless expected_quantity
      next unless food.quantity < expected_quantity

      list << {
        food:,
        remaining_quantity: expected_quantity - food.quantity,
        price: (expected_quantity - food.quantity) * food.price
      }
    end
    list
  end

end
