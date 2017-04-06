# == Schema Information
#
# Table name: balances
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  amount         :float(24)        default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  last_operation :datetime
#

FactoryGirl.define do
  factory :balance do
    user
    amount 100.0
    last_operation Time.now
  end
end
