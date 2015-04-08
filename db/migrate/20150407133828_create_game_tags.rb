class CreateGameTags < ActiveRecord::Migration
  def change
    create_table :game_tags do |t|
      t.integer :tag_id, null: false
      t.integer :game_id, null: false
    end
    add_index :game_tags, [:tag_id, :game_id], unique: true
  end
end
