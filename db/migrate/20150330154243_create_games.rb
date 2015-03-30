class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :min_players, null: false
      t.integer :max_players, null: false
      t.string :playing_time, null: false
      t.string :complexity, null: false
      t.string :designer
      t.date :release_date
      t.string :image_url

      t.timestamps
    end
    add_index :games, :title, unique: true
  end
end
