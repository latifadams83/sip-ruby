class CreateStaffContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_contacts do |t|
      t.string :mobile_phone
      t.string :home_phone
      t.string :office_phone
      t.string :work_phone
      t.string :personal_email
      t.string :work_email
      t.string :created_by
      t.string :updated_by
      t.references :staff, foreign_key: true
      t.timestamps
    end
  end
end
