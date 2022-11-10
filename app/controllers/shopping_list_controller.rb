class ShoppingListController < ApplicationController
  def index
    @user = User.find(current_user.id) 
    @recipe = @user.recipes.find(params[:recipe])
    @missing_food = []
    @total_price = 0
    @total_missing_food = 0
    @recipe.recipe_foods.each do |food|
      next if (Food.find(food.food_id).quantity).nil?
      next if (food.quantity) <= (Food.find(food.food_id).quantity)
      @total_value += (food.quantity - Food.find(food.food_id).quantity) * food.food.price
      @total_missing_food += 1
      @missing_food << food
    end
  end
end