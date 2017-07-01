class HomeController < ApplicationController
  def index
    @recipes_type = RecipeType.all
    @cuisines = Cuisine.all
    if params[:search].blank?
      @recipes = Recipe.all
      flash[:error] = ""
    else
      @recipes = Recipe.search("%#{params[:search]}%").order("created_at DESC")
      flash[:error] = "Resultado da busca por: #{params[:search]}"
    end
  end
end
