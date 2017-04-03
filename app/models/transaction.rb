# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  kind       :string(255)
#  amount     :float(24)
#  balance_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ActiveRecord::Base
  belongs_to :balance
end
