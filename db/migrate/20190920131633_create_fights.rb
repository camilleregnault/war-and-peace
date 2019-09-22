class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.integer :winner_id
      t.integer :winner_weapon_id
      t.integer :winner_nb_attack
      t.integer :looser_id
      t.integer :looser_weapon_id
      t.integer :looser_nb_attack
      t.text :detail, default: [], array: true
      t.timestamps
    end
  end
end
