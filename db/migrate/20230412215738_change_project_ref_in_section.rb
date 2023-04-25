class ChangeProjectRefInSection < ActiveRecord::Migration[7.0]
  def change
    change_table :sections do |t|
      t.belongs_to :project
    end
  end
end
