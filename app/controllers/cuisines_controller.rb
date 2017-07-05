class CuisinesController < ApplicationController

  before_action :find_cuisine, only: [:show]
  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:error] = "Você deve informar o nome da cozinha"
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
    @cuisines = Cuisine.all
     @recipes_type = RecipeType.all
  end

end
