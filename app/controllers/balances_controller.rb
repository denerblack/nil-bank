class BalancesController < ApplicationController
  def index
    @extract = BalanceManager.extract(current_user)
  end
end
