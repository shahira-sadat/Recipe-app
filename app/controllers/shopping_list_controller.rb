class ShoppingListController < ApplicationController
  def index
    @user_food = current_user.foods
    @recipe = current_user.recipes
    @missing_food = []
    @total_price = 0
    @total_missing_food = 0
    @recipe.recipe_foods.each do |food|
      if @user_food.find(food.food_id).quantity.nil?
        @total_price += food.quantity * food.food.price
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
  # @recipe = current_user.recipes
  #     @food_amount = 0
  #   @total_price = 0
  #   @recipe_foods = []
  #   @foods = current_user.foods
  #   @recipes = current_user.recipes
  #   @recipes.includes(:recipe_foods).each do |recipe|
  #     recipe.recipe_foods.map do |food|
  #       @recipe_foods << food
  #     end
  #   end
  #   @recipe_foods.each do |f|
  #     @total_price += f.food.price * f.quantity
  #   end
  # end
end
