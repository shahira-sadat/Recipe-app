class ShoppingListController < ApplicationController
  def index
    @user_food = current_user.foods.all
    @recipe = current_user.recipes.find(params[:recipe])
    @missing_food = []
    @total_price = 0
    @total_missing_food = 0
    @recipe.recipe_foods.each do |food|
       if (@user_food.find(food.food_id).quantity).nil?
        @total_price += (food.quantity) * food.food.price
      @total_missing_food += 1
      @missing_food << food
      next
    end
      next if (food.quantity) <= (@user_food.find(food.food_id).quantity)
      @total_price += (food.quantity - @user_food.find(food.food_id).quantity) * food.food.price
      @total_missing_food += 1
      @missing_food << food
    end
  end
end