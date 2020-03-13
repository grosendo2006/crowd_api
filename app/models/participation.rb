class Participation < ApplicationRecord
  belongs_to :rol
  belongs_to :person
  belongs_to :movie

  def rol_name
    rol.name
  end
end
