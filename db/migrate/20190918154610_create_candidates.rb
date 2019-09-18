class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :popularity_points
      t.integer :attack_strength
      t.string :photo

      t.timestamps
    end
  end
end
