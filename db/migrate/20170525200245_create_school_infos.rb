class CreateSchoolInfos < ActiveRecord::Migration[5.0]
  def self.up
    create_table :school_infos do |t|
      t.string :name
      t.string :alias
      t.string :code
      t.string :slogan
      t.string :location
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :email
      t.string :phone
      t.string :logo
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :school_infos
  end
end
