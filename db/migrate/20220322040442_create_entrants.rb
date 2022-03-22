class CreateEntrants < ActiveRecord::Migration[7.0]
  def change
    create_table :entrants do |t|
      t.belongs_to :tournament, null: false, foreign_key: true
      t.string :userid
      t.string :name
      t.string :player_number
      t.integer :rating
      t.string :division

      t.timestamps
    end
  end
end
