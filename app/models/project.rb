# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  owner          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category       :string(255)
#  handle         :string(255)
#  thumbnail_url  :string(255)
#  pledge_percent :integer
#  description    :text
#  score          :integer
#  video          :boolean
#

class Project < ActiveRecord::Base
end
