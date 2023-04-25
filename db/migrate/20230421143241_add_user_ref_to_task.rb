class AddUserRefToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :user, foreign_key: true, optional: true
  end
end
