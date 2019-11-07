class ParanormalExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :paranormal_experiences do |t|
      t.integer :haunt_id
      t.integer :ghost_hunter_id
  end
end
