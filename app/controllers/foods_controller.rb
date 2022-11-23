class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    respond_to do |format|
      format.html do
        if @food.save
          redirect_to foods_path, notice: 'Food was successfully created'
        else
          render :new, status: 'Food was not successfully created'
        end
      end
    end
  end

  def destroy
    food = Food.find(params[:id])
    if food.destroy
      flash[:success] = 'Food was successfully deleted'
    else
      flash[:error] = 'Food was not successfully deleted'
    end

    redirect_to foods_path
  end

  private

  def food_params
    params.require(:new_food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
