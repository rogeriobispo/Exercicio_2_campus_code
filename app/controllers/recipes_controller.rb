class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipes_type = RecipeType.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    set_params
    if  @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      @cuisines = Cuisine.all
      @recipes_type = RecipeType.all
      render :edit
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @cuisines = Cuisine.all
    @recipes_type = RecipeType.all
  end

def create
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipes_type = RecipeType.all
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
   @recipe.recipe_type_id = params[:recipe][:recipe_type_id]
   @recipe.cuisine_id = params[:recipe][:cuisine_id]
   @recipe.difficulty = params[:recipe][:difficulty]
   @recipe.cook_time = params[:recipe][:cook_time]
   @recipe.ingredients = params[:recipe][:ingredients]
   @recipe.method = params[:recipe][:method]
  end

end
