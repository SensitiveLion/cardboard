class AddAuthorityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authority, :string, null: false, default: "user"
  end
end
