class CreateStaffs < ActiveRecord::Migration[5.0]
  def self.up
    create_table :staffs do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :religious_denomination
      t.string :marital_status
      t.string :phone
      t.date :joining_date
      t.integer :staff_department_id
      t.date :employment_date
      t.string :employee_id
      t.string :qualification
      t.string :specialization
      t.string :rank
      t.string :registered_no
      t.string :sssnit_no
      t.integer :user_id
      t.string :created_by
      t.string :updated_by
      t.timestamps
      t.string :photo
      t.boolean :is_active, null: false, default: true
      t.string :slug
    end
    add_index :staffs, :slug, unique: true
    add_index :staffs, :staff_department_id
    add_index :staffs, :user_id
  end
  def self.down
    drop_table :staffs
  end
end
