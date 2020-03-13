class Participation < ApplicationRecord
  belongs_to :role
  belongs_to :person
  belongs_to :movie

  def role_name
    role.name
  end
end
