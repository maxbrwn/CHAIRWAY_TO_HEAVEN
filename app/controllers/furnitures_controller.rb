class FurnituresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @furnitures = Furniture.search_details(params[:query])
    else
      @furnitures = Furniture.all
    end
  end

  def show
    @furniture = Furniture.find(params[:id])
    @booking = Booking.new
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
