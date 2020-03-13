class Rol < ApplicationRecord
  # TODO cambiar a role
  has_many :participations
  has_many :people, through: :participations
end
