class CreateBadges < ActiveRecord::Migration[5.0]
  def self.up
    create_table :badges do |t|
      t.string :name
      t.references :programme, foreign_key: true
      t.references :gradelevel, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :status, null: false, default: true
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :badges
  end
end
