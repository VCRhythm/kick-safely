# == Schema Information
#
# Table name: approvals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Approval < ActiveRecord::Base
	attr_accessible :project_id, :user_id
	belongs_to :user
	belongs_to :project
	validates :user_id, presence: true
	validates :project_id, presence: true
end
