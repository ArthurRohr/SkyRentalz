class Jet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, :model, :jetType, :capacity, :price, :location, presence: true

  has_many_attached :photos
end
