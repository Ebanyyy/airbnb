class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many :reviews, as: :reviewable
  has_many_attached :photos
end
