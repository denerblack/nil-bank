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

class ManagerVisit < ActiveRecord::Base
  belongs_to :user
  belongs_to :manager, class_name: "User", foreign_key: 'manager_id'
end
