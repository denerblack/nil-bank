class ManagerVisit < ActiveRecord::Base
  belongs_to :user
  has_one :manager, class_name: "User", foreign_key: 'manager_id'
end
