class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
  end

  def create
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    set_params
    if  @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      render :new
    end
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
