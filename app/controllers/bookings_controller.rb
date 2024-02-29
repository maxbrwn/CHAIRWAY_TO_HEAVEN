class BookingsController < ApplicationController
  before_action :set_furniture, only: [:new, :create]
  before_action :set_booking, only: [:accept, :reject]


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
    # @total_price = (@booking.renting_end - @booking.renting_start).to_i + 1
    @bookings_for_user_furnitures = Booking.joins(:furniture).where("furnitures.user_id = ?", current_user.id)
  end

  def accept
    @booking.update(status: "accepted")
    redirect_to profile_path
  end

  def reject
    @booking.update(status: "rejected")
    redirect_to profile_path
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:furniture_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:comment, :renting_start, :renting_end, :confirmation, :status)
  end

end
