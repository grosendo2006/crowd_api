class Movie < ApplicationRecord
  has_many :participations
  has_many :persons, through: :participations
end
