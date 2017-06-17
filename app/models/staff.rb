class Staff < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :staff_department
  has_many :staff_qualifications

  # Categories = %w[Academic Non-Academic].freeze

  extend FriendlyId
    friendly_id :last_name, use: :slugged

  def should_generate_new_friendly_id?
    last_name_changed?
  end
  validates_presence_of :first_name, :last_name, :gender, :joining_date, :staff_department_id

  def full_name(title=nil)
    self.title + ' ' + self.last_name + ' ' + self.first_name 
  end
end
