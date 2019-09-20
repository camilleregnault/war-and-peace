class RemoveLooserIdFromFights < ActiveRecord::Migration[6.0]
  def change
    remove_column :fights, :looser_id, :integer
  end
end
