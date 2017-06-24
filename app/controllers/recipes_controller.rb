class RecipesController < ApplicationController
  before_action :make_response, only: [:show]

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
  end

  def make_response
    true
  end

  def create
    @recipe = Recipe.new
    set_params
    @recipe.save
    redirect_to recipe_path(@recipe.id)
  end

private
  def set_params
   @recipe.title =  params[:recipe][:title]
   @recipe.recipe_type = params[:recipe][:recipe_type]
   @recipe.cuisine_id = params[:recipe][:cuisine_id]
   @recipe.difficulty = params[:recipe][:difficulty]
   @recipe.cook_time = params[:recipe][:cook_time]
   @recipe.ingredients = params[:recipe][:ingredients]
   @recipe.method = params[:recipe][:method]
  end

end
