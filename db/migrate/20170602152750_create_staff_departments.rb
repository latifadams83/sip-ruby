class CreateStaffDepartments < ActiveRecord::Migration[5.0]
  def self.up
    create_table :staff_departments do |t|
      t.string :name
      t.string :creatd_by
      t.string :updated_by
      t.timestamps
    end
  end
  def self.down
    drop_table :staff_departments
  end
end
