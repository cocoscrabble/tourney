class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.belongs_to :tournament, null: false, foreign_key: true
      t.belongs_to :entrant, null: false, foreign_key: true
      t.string :division
      t.string :round
      t.references :opponent, null: false
      t.integer :score
      t.integer :opponent_score
      t.boolean :first

      t.timestamps
    end
    add_foreign_key :results, :entrants, column: :opponent_id
  end
end
