class InvestmentsPortfolioController < ApplicationController
  def index
    @investments = InvestimentsManager.quotations
  end

  def purchase
    InvestimentsManager.purchase(params[:investments_portfolio].values)
    redirect_to :index_path
  end
end
