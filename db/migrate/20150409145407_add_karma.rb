class AddKarma < ActiveRecord::Migration
  def change
    add_column :users, :xp_score, :integer, defult: 0, unique: true
  end
end
