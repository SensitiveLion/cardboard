class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.integer :game_rating
      t.integer :upvotes
    end
  end
end
