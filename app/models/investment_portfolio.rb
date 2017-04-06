class InvestmentPortfolio < ActiveRecord::Base
  belongs_to :user

  ACTIONS = %w(PETR4.SA VALE5.SA BVMF3.SA BRML3.SA ALSC3.SA MULT3.SA BBAS3.SA ITSA6.SA)

  validates_inclusion_of :action, :in => ACTIONS

  enum status: [:purchased, :sold]
end
