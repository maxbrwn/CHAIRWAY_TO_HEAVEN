class Furniture < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_details,
    against: [:title, :address, :description, :condition, :category],
    using: {
      tsearch: { prefix: true }
    }
end
