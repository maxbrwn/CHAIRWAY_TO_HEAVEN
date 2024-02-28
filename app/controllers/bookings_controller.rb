class BookingsController < ApplicationController
  before_action :set_furniture, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.furniture_id = @furniture.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to profile_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def profile
    @bookings = Booking.all
    # @booking = Booking.find(params[:id])
    @furnitures = Furniture.all
    @user = current_user
    # @total_price = (@booking.renting_end - @booking.renting_start).to_i + 1
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:furniture_id])
  end

  def booking_params
    params.require(:booking).permit(:comment, :renting_start, :renting_end, :confirmation)
  end

end
