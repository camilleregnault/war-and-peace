class AddDetailFromFights < ActiveRecord::Migration[6.0]
  def change
    add_column :fights, :detail, :text, array: true, default: []
  end
end
