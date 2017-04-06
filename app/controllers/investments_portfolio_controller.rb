class InvestmentsPortfolioController < ApplicationController
  def index
    @investments = InvestimentsManager.quotations
    @investment_portfolios = InvestimentsManager.user_investments(current_user)
  end

  def purchase
    InvestimentsManager.purchase(params[:investments_portfolio].values)
    redirect_to :index_path
  end

  def sale

  end
end
