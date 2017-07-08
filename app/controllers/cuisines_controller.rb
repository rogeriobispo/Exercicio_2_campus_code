class CuisinesController < ApplicationController

  before_action :find_cuisine, only: [:show]
  before_action :populate_vars, only: [:show, :list, :edit, :update, :new, :create]

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def list
    @cuisines = Cuisine.all
  end

  def update
    @cuisine = Cuisine.find(params[:id])
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      flash[:error] = cuisini_message = cuisini_message(cuisine_params[:name])
      render :edit
    end
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:error] = cuisini_message(cuisine_params[:name])
      render :new
    end
  end

  def show
  end

private
  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

  def find_cuisine
    @cuisine_default = Cuisine.find(params[:id])
  end

  def populate_vars
    @cuisines = Cuisine.all
    @recipes_type = RecipeType.all
  end

  def cuisini_message(cuisine_name)
     Cuisine.where(name: cuisine_name).exists? ? "Cozinha ja existe" : "Você deve informar o nome da cozinha"
  end

end
