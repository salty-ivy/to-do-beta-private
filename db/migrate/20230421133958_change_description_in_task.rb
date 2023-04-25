class ChangeDescriptionInTask < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :description, :string, :null => true
  end
end
