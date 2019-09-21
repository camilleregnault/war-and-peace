class AddColumnWinnerLooserFromFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :winner_name, :string
    add_column :fights, :winner_photo, :string
    add_column :fights, :looser_name, :string
    add_column :fights, :looser_photo, :string
  end
end
