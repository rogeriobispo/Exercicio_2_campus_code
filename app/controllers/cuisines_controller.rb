class CuisinesController < ApplicationController

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(name: params[:cuisine][:name])
    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:error] = @cuisine.errors.messages[:name]
      render :new
    end
  end

  def show
    @cuisine = Cuisine.find(params[:id])
  end

end
