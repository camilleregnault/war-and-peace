class AddColumnLooserAttacksFromFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :looser_id, :integer
    add_column :fights, :winner_nb_attack, :integer
    add_column :fights, :looser_nb_attack, :integer
  end
end
