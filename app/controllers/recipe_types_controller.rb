class RecipeTypesController < ApplicationController

  before_action :find_recipe_type, only: [:show]

  def show
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(recipe_type_params)
  if @recipe_type.save
    redirect_to @recipe_type
  else
    flash[:error] = "Você deve informar o nome do tipo de receita"
    render :new
  end
  end

private
  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end

  def find_recipe_type
    @recipes_type_default = RecipeType.find(params[:id])
    @cuisines = Cuisine.all
    @recipes_type = RecipeType.all
  end

end
