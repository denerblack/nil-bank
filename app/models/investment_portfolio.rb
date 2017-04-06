# == Schema Information
#
# Table name: investment_portfolios
#
#  id             :integer          not null, primary key
#  action         :string(255)
#  status         :integer
#  purchase_price :float(24)
#  sale_price     :float(24)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class InvestmentPortfolio < ActiveRecord::Base
  belongs_to :user

  ACTIONS = %w(PETR4.SA VALE5.SA BVMF3.SA BRML3.SA ALSC3.SA MULT3.SA BBAS3.SA ITSA6.SA)

  validates_inclusion_of :action, :in => ACTIONS

  enum status: [:purchased, :sold]
end
