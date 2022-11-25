class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user = current_user

    if recipe.save
      redirect_to recipe, notice: 'Recipe was successfully created.'
    else
      redirect_to new_recipe_path, notice: 'Recipe was not successfully created.'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      redirect_to recipes_path
      flash[:success] = 'Recipe was deleted Successfully'
    else
      redirect_to recipe
      flash[:error] = 'Recipe was not deleted successfully'
    end
  end

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
