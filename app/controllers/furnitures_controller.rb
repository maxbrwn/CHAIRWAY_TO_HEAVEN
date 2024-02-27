class FurnituresController < ApplicationController
  def index
    @furnitures = Furniture.all
  end

  def show
    @furniture = Furniture.find(params[:id])
  end

  def new
    @furniture = Furniture.new
  end

  def create
  end

end
