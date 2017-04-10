class InvestmentsPortfolioController < ApplicationController
  before_filter :load_investments, only: :index
  after_filter :load_investments, only: [:sale, :purchase]
  def index
  end

  def purchase
    InvestimentsManager.purchase(params[:investments_portfolio].values)
    load_investments
  end

  def sale
    InvestimentsManager.sale(investments_portfolio_params, current_user)
    load_investments
  end

  private

  def investments_portfolio_params
    params.require(:investment_portfolio).permit(:id, :sale_price, :status, :sale_quantity)
  end

  def load_investments
    @investments = InvestimentsManager.quotations
    @investment_portfolios = InvestimentsManager.user_investments(current_user)
  end
end
