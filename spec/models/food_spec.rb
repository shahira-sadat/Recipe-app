require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'ahmad', email: 'ahmad@gmail.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
    @food = Food.create(name: 'Cake', measurement_unit: 'kilogram', price: 10, user_id: @user.id)
  end

  it 'name should not be blank' do
    subject.name = 'Cake'
    expect(subject.name).to eq 'Cake'
  end
  it 'measurement_unit field should not be blank' do
    subject.measurement_unit = 'kilograms'
    expect(subject.measurement_unit).to eq 'kilograms'
  end

  it 'price must be an integer greater than or equal to 0' do
    subject.price = 3
    expect(subject.price).to be >= 0
  end
end
