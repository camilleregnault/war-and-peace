class AddWeaponsFromFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :winner_weapon, :string
    add_column :fights, :looser_weapon, :string
  end
end
