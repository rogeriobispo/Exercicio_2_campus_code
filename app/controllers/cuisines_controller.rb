class CuisinesController < ApplicationController

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.create(name: params[:cuisine][:name])
    redirect_to (cuisine_path(@cuisine.id)) and return if @cuisine.valid?
    render template: "cuisines/errors.html.erb"
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

end
