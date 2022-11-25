class RecipeFoodsController < ApplicationController
  def create
    recipe_food = RecipeFood.new(recipe_food_params)

    if recipe_food.save
      flash[:notice] = 'Food was successfull created'
    else
      flash[:status] = 'Food was not successfully created'
    end

    redirect_to recipe_path(recipe_food_params['recipe_id'])
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])

    if recipe_food.destroy
      flash[:success] = 'Ingredient was successfully deleted'
    else
      flash[:error] = 'Ingredient was not successfully deleted'
    end

    redirect_to recipe_path(recipe_food.recipe)
  end

  private

  def recipe_food_params
    params.require(:new_recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
