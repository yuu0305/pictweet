class AddAllowedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :allowed, :boolean, default: false, null: false
  end
end
