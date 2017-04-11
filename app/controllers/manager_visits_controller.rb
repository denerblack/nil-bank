class ManagerVisitsController < ApplicationController
  def index
    @visits = ManagerVisit.all
  end

  def create
    current_user.manager_visits.create(manager: User.where(manager: true).first, amount: 250.0)
    balance = current_user.balance
    balance.subtract(250.0)

    redirect_to :manager_visits
  end

end
