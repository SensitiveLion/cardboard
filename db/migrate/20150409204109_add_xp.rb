class AddXp < ActiveRecord::Migration
  def change
    add_column :users, :xp, :integer, default: 0, unique: true
  end
end
