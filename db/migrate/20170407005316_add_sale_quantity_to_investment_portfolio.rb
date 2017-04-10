class AddSaleQuantityToInvestmentPortfolio < ActiveRecord::Migration
  def change
    add_column :investment_portfolios, :sale_quantity, :integer
  end
end
