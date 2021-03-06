# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation, :skill_ids
	has_secure_password

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

    has_many :comments, dependent: :destroy
	has_many :approvals, dependent: :destroy
	has_and_belongs_to_many :skills

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
			  format: { with: VALID_EMAIL_REGEX },
			  uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: { minimum:6}
	validates :password_confirmation, presence: true
	
	def approve?(project_id)
		approvals.find_by_project_id(project_id)
	end
	
	def approve!(project)
		approvals.create!(project_id: project.id)
	end
	def unapprove!(project)
		approvals.find_by_project_id(project.id).destroy
	end
	def feed
		Comment.where("user_id = ?", id)
	end
	
	private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end

	
end
