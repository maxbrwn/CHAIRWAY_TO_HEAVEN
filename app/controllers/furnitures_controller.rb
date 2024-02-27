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
    @user_id = current_user.id
    @furniture = Furniture.new(params_furniture)
    @furniture.user_id = @user_id
    if @furniture.save
      redirect_to furniture_path(@furniture)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_furniture
    params.require(:furniture).permit(:title, :address, :description, :condition, :availability,
                                      :category, :price, :photo)
  end
end
