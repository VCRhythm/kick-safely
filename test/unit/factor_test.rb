# == Schema Information
#
# Table name: factors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  effect     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FactorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
