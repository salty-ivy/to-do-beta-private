class RemovePrjectFromSections < ActiveRecord::Migration[7.0]
  def change
    remove_reference :sections, :prject
  end
end
