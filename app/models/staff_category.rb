class StaffCategory < ApplicationRecord
  has_many :staffs

  validates_presence_of :name
end
