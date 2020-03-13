class Person < ApplicationRecord
  has_many :participations
  has_many :movies, through: :participations
  has_many :roles, through: :participations

  validates :first_name, presence: true
  validates :last_name, presence: true

  def participations_in(movie)
    participations.where(movie: movie).map(&:role_name)
  end
end
