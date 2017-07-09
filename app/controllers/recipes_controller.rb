class RecipesController < ApplicationController
  before_action :set_objects, only: [:new, :edit, :create, :update, :old, :show]
  before_action :find_recipe, only: [:show, :update, :edit]
    before_action :authenticate_user!, only: [:edit, :new]

  def old
    @recipe_olds = Recipe.all
  end
  def show
  end

  def new
    @recipe = Recipe.new
  end

  def update
    if  @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      @cuisines = Cuisine.all
      @recipes_type = RecipeType.all
      render :edit
    end
  end

  def edit
  end

  def search

  end

  def create
    @recipe = Recipe.new(recipe_params)
    if  @recipe.save
      redirect_to @recipe
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      render :new
    end
  end

private
  def recipe_params
    params.require(:recipe).permit(:title,:cook_time, :ingredients,
    :recipe_type_id, :cuisine_id, :difficulty, :cookt_time, :igredients,
    :method, :recipe_type_id)
  end

  def set_objects
    @cuisines = Cuisine.all
    @recipes_type = RecipeType.all
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
