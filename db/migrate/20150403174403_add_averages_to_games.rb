class AddAveragesToGames < ActiveRecord::Migration
  def up
    add_column :games, :average, :float, :default => 0.0, :null => false
    add_index :games, :average
  end
  
  def down
    remove_column :games, :average
  end
end
