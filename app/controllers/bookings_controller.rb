class BookingsController < ApplicationController
  before_action :set_furniture, only: [:new, :create]

  def create
    @booking = Booking.new(booking_params)
    @booking.furniture_id = @furniture.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to profile_path(current_user)
    else
      render "furnitures/show", status: :unprocessable_entity
    end
  end

  def profile
    @bookings = Booking.all
    @furnitures = Furniture.all
    @user = current_user
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:furniture_id])
  end

  def booking_params
    params.require(:booking).permit(:comment, :renting_start, :renting_end, :confirmation)
  end

end
