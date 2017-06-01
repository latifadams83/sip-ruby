class Badge < ApplicationRecord
  belongs_to :programme
  belongs_to :gradelevel

  validates_presence_of :name, :gradelevel_id, :programme_id
  def full_name()
    self.gradelevel.level.to_s + self.name
  end
end
