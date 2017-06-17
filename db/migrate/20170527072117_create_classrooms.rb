class CreateClassrooms < ActiveRecord::Migration[5.0]
  def self.up
    create_table :classrooms do |t|
      t.string :name
      t.integer :capacity
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
