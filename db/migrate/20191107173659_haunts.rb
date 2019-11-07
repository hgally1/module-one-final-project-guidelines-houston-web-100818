class Haunts < ActiveRecord::Migration[5.0]
  def change
    create_table :haunts do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :description
      #t.boolean :haunted_accomodation
    end
  end
end
