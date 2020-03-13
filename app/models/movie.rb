class Movie < ApplicationRecord

  has_many :participations
  has_many :people, through: :participations

  validates :title, presence: true
  validates :release_year, numericality: { only_integer: true }

end
