# == Schema Information
#
# Table name: transactions
#
#  id             :integer          not null, primary key
#  kind           :string(255)
#  amount         :float(24)        default("0")
#  balance_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_target_id :integer
#  user_source_id :integer
#

FactoryGirl.define do
  factory :transaction do
    balance
  end
end
