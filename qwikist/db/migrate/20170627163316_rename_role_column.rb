class RenameRoleColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :role, :userrole
  end
end
