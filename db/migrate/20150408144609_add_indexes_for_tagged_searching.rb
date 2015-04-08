class AddIndexesForTaggedSearching < ActiveRecord::Migration
  def change
    add_index :tags, :name, unique: true
    add_index :game_tags, :game_id, unique: true
  end
end
