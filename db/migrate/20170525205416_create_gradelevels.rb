class CreateGradelevels < ActiveRecord::Migration[5.0]
  def self.up
    create_table :gradelevels do |t|
      t.string :name
      t.integer :level
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    add_index :gradelevels, :level, unique: true
  end
  def self.down
    drop_table :gradelevels
  end
end
