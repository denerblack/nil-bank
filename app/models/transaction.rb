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
#

class Transaction < ActiveRecord::Base
  belongs_to :balance
  belongs_to :user_target, class_name: "User", foreign_key: 'user_target_id'
  belongs_to :user_source, class_name: "User", foreign_key: 'user_source_id'
  [:transfer, :withdraw, :deposit, :tax]
end
