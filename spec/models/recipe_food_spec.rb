require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.create(name: 'ahmad', email: 'ahmad@gmail.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
    @recipe = Recipe.create(name: 'Chicken wings', preparation_time: '1 hours', cooking_time: '2 hours',
                            description: 'Test', public: false, user_id: @user.id)
    @food = Food.create(name: 'Cake', measurement_unit: 'kilogram', price: 10, user_id: @user.id)
  end
  it 'is valid' do
    recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: 2)
    expect(recipe_food).to be_valid
  end
  it 'should not be valid without quantity' do
    recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: nil)
    expect(recipe_food).to_not be_valid
  end
end
