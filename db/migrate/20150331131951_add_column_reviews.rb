class AddColumnReviews < ActiveRecord::Migration
  def up
    add_column :reviews, :game_id, :integer, null: false
  end

  def down
    remove_column :reviews, :game_id, :integer
  end
end
