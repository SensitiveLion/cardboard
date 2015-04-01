class AddProfilePhotoToUsers < ActiveRecord::Migration
  def up
    add_column :users, :profile_photo, :string
    remove_column :users, :avatar_url, :string
  end
  def down
    add_column :users, :avatar_url, :string
    remove_column :users, :profile_photo, :string
  end
end
