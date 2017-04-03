class HomeController < ApplicationController
  def index
    @balance = current_user.balance.amount
    @investiments = InvestimentsManager.quotations
  end
end
