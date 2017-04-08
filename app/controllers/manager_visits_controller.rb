class ManagerVisitsController < ApplicationController
  def index
    @visits = ManagerVisit.all
  end

  def create
    current_user.manager_visits.create(manager: User.where(manager: true).first )
    redirect_to :manager_visits
  end

end
