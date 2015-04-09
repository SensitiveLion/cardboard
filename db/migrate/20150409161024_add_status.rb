class AddStatus < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer, default: 0, unique: true
  end
end
