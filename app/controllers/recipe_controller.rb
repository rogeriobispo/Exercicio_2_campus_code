class RecipeController < ApplicationController
  before_action :make_response, only: [:show]

  def show
    @recipe = Recipe.find(params[:id])
  end

  def make_response
    true
  end
end
