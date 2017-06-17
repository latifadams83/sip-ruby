class CreateStaffCategories < ActiveRecord::Migration[5.0]
  def self.up
    create_table :staff_categories do |t|
      t.string :name
    end
    add_index :staff_categories, :name, unique: true
  end

  def self.down
    drop_table :staff_categories
  end
end
