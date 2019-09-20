class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.integer :winner_id
      t.integer :looser_id

      t.timestamps
    end
  end
end
