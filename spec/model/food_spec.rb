require 'rails_helper'

RSpec.describe 'Food', type: :model do
  subject do
    user = User.create(name: 'Demo', email: 'demo@example.com', confirmed_at: Time.now, password: '11111')
    Food.new(
      name: 'Salt',
      measurement_unit: 'tablespoon',
      price: 15,
      quantity: 10,
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

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price should be greater_than_or_equal_to zero' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'quantity should be greater_than_or_equal_to zero' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end
end
