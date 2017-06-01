class CreateClassrooms < ActiveRecord::Migration[5.0]
  def self.up
    create_table :classrooms do |t|
      t.string :name
      t.integer :capacity
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
