class Movie < ApplicationRecord
  has_many :participations
  has_many :people, through: :participations

  def release_year
    'MCCVX'
  end
end
