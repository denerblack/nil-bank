class BalancesController < ApplicationController
  def index
    @extract = BalanceManager.extract(current_user)
  end

  def search
    @extract = BalanceManager.extract(current_user, params[:start_date], params[:end_date])
  end
end
