class User < ApplicationRecord
  belongs_to :role
  has_many :staffs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

	 EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i
	 validates_uniqueness_of :email
	 validates_presence_of :email, :password, :role
	 validates_format_of :email, with: EMAIL_REGEX


  def super?
   self.role.name == "super administrator"
  end

  def admin?
   self.role.name == "administrator"
  end

  def teacher?
   self.role.name == "teacher"
  end

  def student?
   self.role.name == "student"
  end

  def guardian?
   self.role.name == "guardian"
  end
end
