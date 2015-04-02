class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id, null: false
      t.integer :review_id
      t.boolean :upvote, default: false

      t.timestamps
    end
  end
end
