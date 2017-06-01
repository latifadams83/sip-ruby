class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

 ROLES = %w[super_admin admin clerk teacher student guardian].freeze

	 EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i
	 validates_uniqueness_of :email
	 validates_presence_of :email, :password, :role
	 validates_format_of :email, with: EMAIL_REGEX

  def super?
   self.role == "super_admin"
  end

  def admin?
   self.role == "admin"
  end

  def clerk?
    self.role == "clerk"
  end

  def teacher?
   self.role == "teacher"
  end

  def student?
   self.role == "student"
  end

  def guardian?
   self.role == "guardian"
  end
end
