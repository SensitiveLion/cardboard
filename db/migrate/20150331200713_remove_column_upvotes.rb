class RemoveColumnUpvotes < ActiveRecord::Migration
  def up
    remove_column :reviews, :upvotes
  end

  def down
    add_column :reviews, :upvotes, :integer, null: false
  end
end
