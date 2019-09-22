class RemoveBIdFromFights < ActiveRecord::Migration[6.0]
  def change
    remove_column :fights, :b_id, :integer
  end
end
