class RemoveAIdBIdAAttackBAttackFromFights < ActiveRecord::Migration[6.0]
  def change

    remove_column :fights, :a_id, :integer
    remove_column :fights, :b_id, :integer
    remove_column :fights, :a_attack, :integer
    remove_column :fights, :b_attack, :integer
  end
end
