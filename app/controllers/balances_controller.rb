class BalancesController < ApplicationController
  def index
    @extract = BalanceManager.extract(current_user)
  end

  def search
    @extract = BalanceManager.extract(current_user, params[:start_at].to_datetime, params[:end_at].to_datetime)
  end
end
