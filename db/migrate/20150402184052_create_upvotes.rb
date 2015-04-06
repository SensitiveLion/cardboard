class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.boolean :upvote, default: false

      t.timestamps
    end
    add_index :upvotes, [:user_id, :review_id], unique: true
  end
end
