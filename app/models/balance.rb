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

  def subtract(value)
    raise "Você não tem saldo suficiente para esta transação" if value > self.amount && user.normal?
    self.amount -= value
    save
  end
end
