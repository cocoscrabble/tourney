class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.belongs_to :tournament, null: false, foreign_key: true
      t.string :division
      t.string :round
      t.references :entrant, null: false, foreign_key: true
      t.references :opponent, null: false, foreign_key: true
      t.integer :score
      t.integer :opponent_score
      t.boolean :first

      t.timestamps
    end
  end
end
