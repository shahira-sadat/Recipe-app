class FoodsController < ApplicationController

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to foods_path
  end

  private

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :price, :measurement_unit, :user_id)
  end
end
