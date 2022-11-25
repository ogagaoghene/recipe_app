require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    described_class.new(name: 'Salt',
                        measurement_unit: 'tablespoon',
                        price: 15,
                        quantity: 10)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a measurement unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when price is not greater_than_or_equal_to zero' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid when quantity is not greater_than_or_equal_to zero' do
    subject.quantity = -1
    expect(subject).to_not be_valid
  end
end
