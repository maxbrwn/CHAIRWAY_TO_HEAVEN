class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :furniture
  validates :user_id, uniqueness: { scope: :furniture_id }
end
