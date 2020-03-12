class Participation < ApplicationRecord
  belongs_to :rol
  belongs_to :person
  belongs_to :movie
end
