class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :person
      t.references :role
      t.references :movie
      t.timestamps
    end
  end
end
