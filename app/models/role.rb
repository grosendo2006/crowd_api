class Role < ApplicationRecord
  has_many :participations
  has_many :people, through: :participations
end
