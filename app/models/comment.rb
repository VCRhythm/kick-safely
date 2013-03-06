# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
	attr_accessible :content, :user_id, :project_id
  belongs_to :user
  belongs_to :project
  validates :content, presence: true, length: {:maximum=>140}
  validates :user_id, presence:true
  validates :project_id, presence:true
  validates_uniqueness_of :user_id, scope: :project_id
  default_scope order: 'comments.created_at DESC'
end
