class GhostHunters < ActiveRecord::Migration[5.0]
  def change
    create_table :ghost_hunters do |t|
      t.string :name
    end
  end
end
