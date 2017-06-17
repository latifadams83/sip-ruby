class CreatePeriods < ActiveRecord::Migration[5.0]
  def self.up
    create_table :periods do |t|
      t.string :name
      t.time :start_time
      t.time :end_time
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
  def self.down
    drop_table :periods
  end
end
