class ShoppingListController < ApplicationController
  def index
    @user = User.find(current_user.id) 
    @foods = @user.foods
  end
end