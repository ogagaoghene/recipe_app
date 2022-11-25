require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    user = User.create(name: 'Demo', email: 'test@example.com', confirmed_at: Time.now, password: '11111')
    Recipe.new(
      name: 'Burger',
      preparation_time: '01:30:00',
      cooking_time: '01:00:00',
      description: 'A burger with spices',
      public: true,
      user:
    )
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'preparation_time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking_time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'description length should be greater than 10' do
    subject.description = 'a' * 9
    expect(subject).to_not be_valid
  end
end
