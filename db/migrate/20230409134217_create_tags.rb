class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tagsname, null: false
      t.timestamps
    end
  end
end
