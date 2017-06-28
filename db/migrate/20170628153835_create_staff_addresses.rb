class CreateStaffAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_addresses do |t|
      t.string :street_address
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :created_by
      t.string :updated_by
      t.references :staff, foreign_key: true
      t.timestamps
    end
  end
end
