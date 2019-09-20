class AddColumnFromFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :a_id, :integer
    add_column :fights, :b_id, :integer
  end
end
