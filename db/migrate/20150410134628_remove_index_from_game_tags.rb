class RemoveIndexFromGameTags < ActiveRecord::Migration
  def up
    remove_index :game_tags, [:game_id]
  end

  def down
    add_index "game_tags", ["game_id"], name: "index_game_tags_on_game_id", unique: true, using: :btree
  end
end
