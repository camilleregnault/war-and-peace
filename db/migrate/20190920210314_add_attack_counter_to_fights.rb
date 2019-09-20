class AddAttackCounterToFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :a_attack, :integer
    add_column :fights, :b_attack, :integer
  end
end
