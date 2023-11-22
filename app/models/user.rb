class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :talents, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :sex, presence: true
  before_validation :validate_age

  private

  def validate_age
    if date_of_birth.present? && date_of_birth.year > 2005
      errors.add(:date_of_birth, 'You should be over 18 years old.')
    end
  end
end
