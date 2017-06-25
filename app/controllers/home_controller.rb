class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @cuisines = Cuisine.all
    @recipes_type = RecipeType.all
  end
end
