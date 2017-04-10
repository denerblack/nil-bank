# == Schema Information
#
# Table name: manager_visits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  manager_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :float(24)
#

require 'rails_helper'

RSpec.describe ManagerVisit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
