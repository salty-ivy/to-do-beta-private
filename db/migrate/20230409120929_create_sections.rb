class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.belongs_to :prject
      t.timestamps
    end
  end
end
