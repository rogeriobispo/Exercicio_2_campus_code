class RecipeTypesController < ApplicationController

  before_action :find_recipe_type, only: [:show]
    before_action :authenticate_user!, only: [:new]

  def show
     flash[:error] = '' #Achei muito zuado isso mas na view não estava limpando a mensagem na tela.
    if @recipes_type_default.recipes.empty?
      flash[:error] = 'Nenhuma receita encontrada para este tipo de receitas'
    end
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
