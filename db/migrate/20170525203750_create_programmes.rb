class CreateProgrammes < ActiveRecord::Migration[5.0]
  def self.up
    create_table :programmes do |t|
      t.string :name
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_index :programmes, :name, unique: true
  end

  def self.down
    drop_table :programmes
  end
end
