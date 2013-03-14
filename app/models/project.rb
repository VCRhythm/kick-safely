# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  owner           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category        :string(255)
#  handle          :string(255)
#  thumbnail_url   :string(255)
#  pledge_percent  :integer
#  description     :text
#  score           :integer
#  video           :boolean
#  featured        :boolean
#  pledge_deadline :string(255)
#

class Project < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :approvals, dependent: :destroy
end
