class ModifyGames < ActiveRecord::Migration
  def up
    remove_column :games, :playing_time
    remove_column :games, :complexity
    add_column :games, :playing_time, :integer
    add_column :games, :complexity, :integer
  end

  def down
    remove_column :games, :playing_time
    remove_column :games, :complexity
    add_column :games, :playing_time, :string
    add_column :games, :complexity, :string
  end
end
