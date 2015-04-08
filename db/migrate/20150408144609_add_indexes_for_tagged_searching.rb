class AddIndexesForTaggedSearching < ActiveRecord::Migration
  def change
    add_index :tags, :name
    add_index :game_tags, :game_id
  end
end
