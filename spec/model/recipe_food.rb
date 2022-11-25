require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    user = User.create(name: 'Demo', email: 'test@example.com', confirmed_at: Time.now, password: '11111')
    recipe = Recipe.create(
      name: 'Burger',
      preparation_time: '01:30:00',
      cooking_time: '01:00:00',
      description: 'A burger with spices',
      public: true,
      user:
    )
    food = Food.create(
      name: 'Salt',
      measurement_unit: 'tablespoon',
      price: 15,
      quantity: 10,
      user:
    )
    RecipeFood.new(recipe:, food:, quantity: 10)
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'food should be present' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'recipe should be present' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'quanity should be present' do
    subject.quanity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be greater than or equal to 0' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end
end
