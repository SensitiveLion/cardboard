class ChangeVotes < ActiveRecord::Migration
  def change
    remove_column :upvotes, :upvote, :boolean, default: false
    remove_column :downvotes, :downvote, :boolean, default: false
    add_column :upvotes, :vote, :boolean, default: false
    add_column :downvotes, :vote, :boolean, default: false
  end
end
