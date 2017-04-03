# == Schema Information
#
# Table name: balances
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Balance < ActiveRecord::Base
  belongs_to :user

  def add(value)
    self.amount += value
    save
  end

  def substract(value)
    self.amount -= value
    save
  end
end
