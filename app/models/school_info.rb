class SchoolInfo < ApplicationRecord
  mount_uploader :logo, PhotoUploader

  validates_presence_of :name, :code
end
