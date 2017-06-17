class Staff < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :staff_qualifications
  belongs_to :staff_category

  extend FriendlyId
    friendly_id :last_name, use: :slugged

  def should_generate_new_friendly_id?
    last_name_changed?
  end
  validates_presence_of :first_name, :last_name, :gender, :joining_date, :staff_category_id

  def full_name(middle_name=nil, title=nil)
    self.title + ' ' + self.first_name + ' '+ self.last_name
  end
end
