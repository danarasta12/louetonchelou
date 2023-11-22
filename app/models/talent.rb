class Talent < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user
  has_many_attached :medias

  validates :pseudo, presence: true
  validates :working_area, presence: true
  validates :talent_type, presence: true
  validates :price, presence: true
  validates :performance_duration, presence: true
  validates :description, presence: true
end
