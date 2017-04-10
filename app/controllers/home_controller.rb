class HomeController < ApplicationController
  def index
    return if current_user.manager?

    @balance = current_user.balance.amount
    @investiments = InvestimentsManager.quotations
  end
end
