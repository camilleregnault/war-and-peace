class Weapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :attack
      t.integer :defence
      t.timestamps
    end
  end
end
