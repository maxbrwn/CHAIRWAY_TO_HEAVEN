class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :furniture
  validates :user_id, uniqueness: { scope: :furniture_id, message: "You have already made a booking for this furniture!"}
end
