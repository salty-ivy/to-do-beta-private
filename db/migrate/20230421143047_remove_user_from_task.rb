class RemoveUserFromTask < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :user_id, :reference
  end
end
