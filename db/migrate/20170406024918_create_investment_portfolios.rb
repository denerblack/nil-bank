class CreateInvestmentPortfolios < ActiveRecord::Migration
  def change
    create_table :investment_portfolios do |t|
      t.string :action
      t.integer :status
      t.float :purchase_price
      t.float :sale_price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
