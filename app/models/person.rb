class Person < ApplicationRecord
  has_many :participations
  has_many :movies, through: :participations
  has_many :rols, through: :participations
end
