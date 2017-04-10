class AddQuantityToInvestmentPortfolios < ActiveRecord::Migration
  def change
    add_column :investment_portfolios, :quantity, :integer
  end
end
