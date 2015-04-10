class RemoveUserIdNullFalse < ActiveRecord::Migration
  def up
    change_column :identities, :user_id, :integer, null: true
  end
  def down
    change_column :identities, :user_id, :integer, null: false
  end
end
